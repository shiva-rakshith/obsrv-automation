resource "aws_s3_bucket_policy" "allow_public_access_to_ingestion_spec_bucket" {
    bucket = aws_s3_bucket.ingestion_spec.id
    policy = <<POLICY
    {
      "Version": "2012-10-17",
      "Id": "MYBUCKETPOLICY",
      "Statement": [
        {
          "Sid": "GetObject",
          "Effect": "Allow",
          "Principal": "*",
          "Action": "s3:GetObject",
          "Resource": "arn:aws:s3:::${local.ingestion_spec_bucket}/*"
        }
      ]
    }
    POLICY
}