# =====================================
# Terraform Backend Configuration
# =====================================
# This file configures the remote backend.
# Terraform stores the state file in an S3 bucket.
# State locking is enabled using use_lockfile = true.
# =====================================================
terraform {
  backend "s3" {
    bucket       = "jagadeesh-terraform-state-project-1"
    key          = "project-1/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}