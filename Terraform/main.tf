provider "aws" {
    region = var.aws_region
    default_tags {
        tags = { 
            name = "Capstone Project"
        }
    }
}

provider "vault" {
    address = ""
}

# terraform {
#     cloud {
#     organization = "example-org-8994f8"
#     hostname = "app.terraform.io" 

#     workspaces {
#       name = "Hangout Point"
#     }
#   }
# }