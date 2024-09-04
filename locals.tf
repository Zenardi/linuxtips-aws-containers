locals {
  expire_on_days = 7
  rotation_hours = local.expire_on_days * 24 # Convert days to hours
  expiration_date = timeadd(formatdate("YYYY-MM-DD'T'HH:mm:ssZ", timestamp()), "${local.rotation_hours}h")
  default_tags = {
    ResourceOwner = "ZEE8CA"
    ExpireOn      = local.expiration_date
    ManagedBy     = "Terraform"
  }
}