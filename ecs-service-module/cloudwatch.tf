resource "aws_cloudwatch_log_group" "main" {
  name = format("%s/%s/logs", var.cluster_name, var.service_name)
  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}