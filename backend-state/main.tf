variable "aws_region" {
    default = "us-east-1"
}

provider "aws" {
    region = var.aws_region
}

resource "aws_s3_bucket" "stanley-terraform-remote-state" {
    bucket = "jenkins-terraform-project"

    lifecycle {
        prevent_destroy = true
    }

    versioning{
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}