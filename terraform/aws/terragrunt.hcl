remote_state {
  backend = "s3"
  config = {
    bucket  = get_env("TF_BACKEND_S3_BUCKET")
    region  = get_env("TF_BACKEND_S3_REGION")
    key     = "${path_relative_to_include()}/${get_env("TF_ENV")}.terraform.tfstate"
    encrypt = true
  }
}