provider "aws" { // My Root Account
  region = "us-east-1"
}

provider "aws" { // My DEV Account
  region = "us-east-1"
  alias  = "dev"

  assume_role {
    role_arn = "arn:aws:iam::639130796919:role/TerraformRole"
  }
}

provider "aws" { // My PROD Account
  region = "us-east-1"
  alias  = "prod"

  assume_role {
    role_arn = "arn:aws:iam::032823347814:role/TerraformRole"
  }
}
#--------------------------------------------------------------

module "servers" {
  source        = "./module_servers"
  instance_type = "t3.small"
  providers = {
    aws.root = aws
    aws.prod = aws.prod
    aws.dev  = aws.dev
  }
}
