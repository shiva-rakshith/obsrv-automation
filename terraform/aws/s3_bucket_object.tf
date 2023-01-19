resource "aws_s3_object" "object" {
    for_each = fileset("../sample-data/", "*")
      bucket = local.ingestion_spec_bucket
      key    = each.value
      source = "../sample-data/${each.value}"
      source_hash = filemd5("../sample-data/${each.value}")
}