resource "aws_s3_bucket" "ingestion_spec" {
    bucket = local.ingestion_spec_bucket

    tags = merge(
      {
        Name = local.ingestion_spec_bucket
      },
      local.common_tags,
      var.additional_tags)
}