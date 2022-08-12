variable "cidr" {
  type    = list(any)
  default = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "az" {
  type    = list(any)
  default = ["us-west-2a", "us-west-2b"]
}

variable "sg_ingress_rules" {
  default = {
    "webserver_rule" = {
      "description" = "For HTTP"
      "from_port"   = "80"
      "to_port"     = "80"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },
    "webserver_rule2" = {
      "description" = "For SSH"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type        = map(any)
  description = "Security group rules for Webserver"
}

variable "sg_ingress_rules_db" {
  default = {
    "db_rule" = {
      "description" = "For HTTP"
      "from_port"   = "3306"
      "to_port"     = "3306"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    },
    "db_rule2" = {
      "description" = "For SSH"
      "from_port"   = "22"
      "to_port"     = "22"
      "protocol"    = "tcp"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type        = map(any)
  description = "Security group rules for DB"
}

