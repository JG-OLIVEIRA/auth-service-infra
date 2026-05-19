resource "aws_instance" "auth_service_server" {
  ami                    = "ami-0cca150d127c2216f"
  instance_type          = "t2.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.auth_service_sg.id]
  iam_instance_profile   = var.iam_instance_profile
  user_data = file("user_data.sh")

  tags = {
    Name        = "auth-service-server"
    Provisioned = "Terraform"
    Cliente     = "Jorge"
  }
}

resource "aws_security_group" "auth_service_sg" {
  name   = "auth-service-sg"
  vpc_id = var.vpc_id
  tags = {
    Name        = "auth-service-sg"
    Provisioned = "Terraform"
    Cliente     = "Jorge"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.auth_service_sg.id
  cidr_ipv4         = var.my_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.auth_service_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.auth_service_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.auth_service_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = -1
}