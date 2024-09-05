resource "aws_launch_template" "spots" {
  name_prefix   = format("%s-spots", var.project_name)
  image_id      = var.nodes_ami
  instance_type = var.node_instance_type

  vpc_security_group_ids = [
    aws_security_group.main.id
  ]

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = "0.15"
    }
  }

  update_default_version = true
  # iam_instance_profile {
  #   # name = aws_iam_instance_profile.main.name
  #   name = "ecsInstanceRole"
  # }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.node_volume_size
      volume_type = var.node_volume_type
    }
  }
  tag_specifications {
    resource_type = "instance"
    tags = merge({
      Name = format("%s-on-deman", var.project_name)
    }, local.default_tags)
  }
  tags = local.default_tags

  user_data = base64encode(templatefile("${path.module}/templates/user-data.tpl", {
    CLUSTER_NAME = var.project_name
  }))
}