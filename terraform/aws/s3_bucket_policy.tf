# resource "aws_s3_bucket_policy" "s3_bucket_policy" {
#     bucket = aws_s3_bucket.storage_bucket.id
#     policy = <<POLICY
#     {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#         "Effect": "Allow",
#         "Action": "s3:ListBucket",
#         "Resource": "arn:aws:s3:::${data.aws_s3_bucket.terraform_storage_bucket.name}"
#         },
#         {
#         "Effect": "Allow",
#         "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
#         "Resource": "arn:aws:s3:::${data.aws_s3_bucket.terraform_storage_bucket.name}/terraform.tfstate"
#         }
#     ]
#     }
#     POLICY
# }

resource "aws_iam_policy" "s3_policy" {
  name        = "obsrv-eks-cluster-s3-policy"
  path        = "/"
  description = "obsrv s3 full access cluster policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:ListStorageLensConfigurations",
          "s3:ListAccessPointsForObjectLambda",
          "s3:GetAccessPoint",
          "s3:PutAccountPublicAccessBlock",
          "s3:GetAccountPublicAccessBlock",
          "s3:ListAllMyBuckets",
          "s3:ListAccessPoints",
          "s3:ListJobs",
          "s3:PutStorageLensConfiguration",
          "s3:ListMultiRegionAccessPoints",
          "s3:CreateJob"
        ],
        "Resource" : "*"
      },
      {
        "Sid" : "VisualEditor1",
        "Effect" : "Allow",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::*/*",
          "arn:aws:s3:::obsrv-data-storage"
        ]
      }
    ]
  })
}
