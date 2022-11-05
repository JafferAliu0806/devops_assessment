# Create security group for EC2 and ALB

resource "aws_security_group" "lb" {
  name   = "ec2-alb-security-group"
  vpc_id = aws_vpc.sg-vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "ec2_alb_sg"
    Project = "sg-assignment"
  }
}

# Create security group for webserver

resource "aws_security_group" "webserver_sg" {
  name   = "webserver_sg"
  vpc_id = aws_vpc.sg-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "HTTP"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name    = "webserver_sg"
    Project = "sg-assignment"
  }
}
