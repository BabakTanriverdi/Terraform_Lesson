terraform {
  backend "s3" {
    bucket       = "Tanriverdi-terraform-remote-state" # Bucket where to SAVE Terraform State
    key          = "dev/terraform.tfstate"          # Object name in the bucket to SAVE Terraform State
    region       = "us-east-1"                      # Region where bucket created
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-1" # Region where to create resources

  default_tags {
    tags = {
      Owner   = "Babak"
      Project = "Terraform From Zero to Professional"
    }
  }
}
