resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = merge({
    Name = format("%s-igw", var.project_name)
  }, local.default_tags)
  lifecycle {
    ignore_changes = [tags]
  }
}