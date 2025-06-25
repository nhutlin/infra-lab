provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_key_pair" "infra-lab-keypair" {
  key_name =  "infra-lab-keypair"
  public_key = file(var.keypair_path)
  
}


module "s3_bucket" {
  source      = "../modules/s3"
  bucket_name = var.bucket_name
}

module "iam_role" {
  source        = "../modules/iam"
  role_name     = var.role_name
  bucket_arn    = module.s3_bucket.bucket_arn
}

module "ec2_instance" {
  source          = "../modules/ec2"
  instance_name   = var.instance_name
  iam_instance_profile = module.iam_role.instance_profile
  user_data       = file("./files/user_data.sh")
  instance_type   = var.instance_type
  key_name        = var.key_name 
}
