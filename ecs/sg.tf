resource "aws_security_group" "main" {
  name   = format("%s", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      #   "0.0.0.0/0"
      "209.221.240.0/24", # NA/Mtp
      "177.11.252.0/24",  # LA/Ca
    ]
  }
  tags = local.default_tags
}

resource "aws_security_group_rule" "subnet_ranges" {
  from_port         = 0
  to_port           = 0
  description       = "Liberado trafego para VPC"
  security_group_id = aws_security_group.main.id
  cidr_blocks = [
    "10.0.0.0/16"
  ]
  protocol = -1
  type     = "ingress"
}