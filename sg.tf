# Security Group created for Webserver
# Ingress Variables for Port 80 and 22 are dynamic
# ---------------------------------------------------

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow tls webserver"
  }
}

# Security Group created for DB
# Ingress Variables for Port 3306 and 22 are dynamic
# ---------------------------------------------------

resource "aws_security_group" "allow_tls_db" {
  name        = "allow_tls_db"
  description = "Allow TLS inbound traffic for db"
  vpc_id      = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules_db
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow tls db"
  }
}