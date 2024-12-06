terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-statefile-dec5-2024"
    key            = "jenkins-server/terraform.tfstate"
    region         = "ap-south-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}