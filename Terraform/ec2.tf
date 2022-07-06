resource "aws_instance" "jenkinsinstance" {
  ami             = var.AMIS[var.aws_region]
  key_name        = var.key_name
  instance_type   = var.instance_type
  security_groups = ["security_jenkins_port"]
  user_data       = data.template_file.user_data.rendered
  tags= {
    Name = "jenkins_Master"
  }
}

# Create Elastic IP address
resource "aws_eip" "jenkinsinstance" {
  vpc      = true
  instance = aws_instance.jenkinsinstance.id
tags= {
    Name = "jenkins_elstic_ip"
  }
}


resource "aws_instance" "mySlaveInstance" {
  ami             = var.AMIS[var.aws_region]
  key_name        = var.key_name
  instance_type   = "t2.micro"
  security_groups = [ "security_jenkins_slave_port"]
  tags= {
    Name = "jenkins_slave"
  }
}

resource "aws_eip" "mySlaveInstance" {
  vpc      = true
  instance = aws_instance.mySlaveInstance.id
tags= {
    Name = "jenkins_slave_elstic_ip"
  }
}