variable "aws_region" {
  default = "us-east-2"
}

variable "key_name" {
  default = "MyJenkinsEC2key"
}

variable "instance_type" {
  default = "t2.small"
}
variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-2 = "ami-02f3416038bdb17fb"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "id_rsa"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "id_rsa.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
