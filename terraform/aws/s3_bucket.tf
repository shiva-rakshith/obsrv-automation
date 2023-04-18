resource "aws_s3_bucket" "storage_bucket" {
    bucket = local.storage_bucket
    cors_rule {
      allowed_headers= ["*"]
      allowed_methods= ["PUT","POST","DELETE"]
        allowed_origins= ["*"]
        expose_headers= []
        max_age_seconds= 3000
    }

    tags = merge(
      {
        Name = local.storage_bucket
      },
      local.common_tags,
      var.additional_tags)
}