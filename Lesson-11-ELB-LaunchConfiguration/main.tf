#----------------------------------------------------------
# Highly Available Web Server (ASG + Classic Load Balancer)
# Made by Babak
#----------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

#----------------------------------------------------------
# Availability Zones
data "aws_availability_zones" "available" {}

#----------------------------------------------------------
# Default VPC
resource "aws_default_vpc" "default" {}

#----------------------------------------------------------
# Default Subnets (2 AZ)
resource "aws_default_subnet" "az1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_default_subnet" "az2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}

#----------------------------------------------------------
# Latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

#----------------------------------------------------------
# Security Group (ELB + EC2 together – acceptable for training)
resource "aws_security_group" "web" {
  name   = "web-sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Web-Security-Group"
    Owner = "Babak"
  }
}

#----------------------------------------------------------
# Launch Template
resource "aws_launch_template" "web" {
  name_prefix   = "web-ha-lt-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = filebase64("${path.module}/user_data.sh")

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  lifecycle {
    create_before_destroy = true
  }
}

#----------------------------------------------------------
# Classic Load Balancer
resource "aws_elb" "web" {
  name            = "web-ha-elb"
  subnets         = [
    aws_default_subnet.az1.id,
    aws_default_subnet.az2.id
  ]
  security_groups = [aws_security_group.web.id]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 10
    target              = "HTTP:80/"
  }

  tags = {
    Name = "WebServer-HA-ELB"
  }
}

#----------------------------------------------------------
# Auto Scaling Group
resource "aws_autoscaling_group" "web" {
  name                = "web-asg"
  min_size            = 2
  max_size            = 2
  desired_capacity    = 2
  health_check_type   = "ELB"
  load_balancers      = [aws_elb.web.name]
  vpc_zone_identifier = [
    aws_default_subnet.az1.id,
    aws_default_subnet.az2.id
  ]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "WebServer-ASG"
    propagate_at_launch = true
  }

  tag {
    key                 = "Owner"
    value               = "Babak"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

#----------------------------------------------------------
# Output
output "web_loadbalancer_url" {
  description = "Classic Load Balancer DNS Name"
  value       = aws_elb.web.dns_name
}
