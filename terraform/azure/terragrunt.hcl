remote_state {
  backend = "s3"
  config = {
    resource_group_name  = get_env("TF_BACKEND_RG_NAME")
    storage_account_name = get_env("TF_BACKEND_STORAGE_NAME")
    container_name       = get_env("TF_BACKEND_CONTAINER_NAME")
    key                  = "${path_relative_to_include()}/${get_env("TF_ENV")}.terraform.tfstate"
    encrypt              = true
  }
}