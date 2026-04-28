provider "aws" {
  region = "ap-southeast-1"
}

# Security Group (ALLOW SSH + PORT 3000)
resource "aws_security_group" "ssh" {
  name        = "allow-ssh"
  description = "Allow SSH access and app port 3000"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# SPOT EC2 INSTANCE
resource "aws_instance" "test" {
  ami           = "ami-02dd44faa40720bb8"
  instance_type = "t2.micro"

  key_name = "n8n"

  vpc_security_group_ids = [aws_security_group.ssh.id]

  instance_market_options {
    market_type = "spot"

    spot_options {
      instance_interruption_behavior = "terminate"
    }
  }

  tags = {
    Name = "terraform-spot-test"
  }
}

# OUTPUT IP
output "instance_ip" {
  value = aws_instance.test.public_ip
}

output "ssh_command" {
  value = "ssh -i n8n.pem ubuntu@${aws_instance.test.public_ip}"
}