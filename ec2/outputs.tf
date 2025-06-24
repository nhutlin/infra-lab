output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "iam_instance_profile" {
  value = module.iam_role.instance_profile
}
