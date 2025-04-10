provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "fortigate_primary" {
  ami           = var.fortigate_ami
  instance_type = var.instance_type
  count         = 1

  tags = {
    Name = "Fortigate-Primary"
  }
}

resource "aws_instance" "fortigate_secondary" {
  ami           = var.fortigate_ami
  instance_type = var.instance_type
  count         = 1

  tags = {
    Name = "Fortigate-Secondary"
  }
}

resource "aws_security_group" "fortigate_sg" {
  name        = "fortigate_sg"
  description = "Security group for Fortigate HA"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface" "fortigate_primary_nic" {
  subnet_id = var.subnet_id
  security_groups = [aws_security_group.fortigate_sg.id]
}

resource "aws_network_interface" "fortigate_secondary_nic" {
  subnet_id = var.subnet_id
  security_groups = [aws_security_group.fortigate_sg.id]
}

output "fortigate_primary_ip" {
  value = aws_instance.fortigate_primary.public_ip
}

output "fortigate_secondary_ip" {
  value = aws_instance.fortigate_secondary.public_ip
}