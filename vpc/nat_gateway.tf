resource "aws_eip" "vpc_eip_1a" {
  domain = "vpc"

  tags = merge({
    Name = format("%s-eip-1a", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_nat_gateway" "nat_1a" {
  allocation_id = aws_eip.vpc_eip_1a.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = merge({
    Name = format("%s-nat-1a", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_eip" "vpc_eip_1b" {
  domain = "vpc"

  tags = merge({
    Name = format("%s-eip-1b", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_nat_gateway" "nat_1b" {
  allocation_id = aws_eip.vpc_eip_1b.id
  subnet_id     = aws_subnet.public_subnet_1b.id

  tags = merge({
    Name = format("%s-nat-1b", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}


resource "aws_eip" "vpc_eip_1c" {
  domain = "vpc"

  tags = merge({
    Name = format("%s-eip-1c", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_nat_gateway" "nat_1c" {
  allocation_id = aws_eip.vpc_eip_1c.id
  subnet_id     = aws_subnet.public_subnet_1c.id

  tags = merge({
    Name = format("%s-nat-1c", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}