variable "region" {
  description = "AWS region"
  type        = string

}
variable "profile" {
  description = "AWS profile"
  type        = string

}
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string

}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string

}

variable "role_name" {
  description = "IAM role name"
  type        = string

}
variable "key_name" {
  description = "Name of the existing AWS EC2 key pair to use"
  type        = string
}

variable "instance_type" {
  description = "Instance type of AWS EC2"
  type        = string
}
variable "keypair_path" {
  description = "Name of the existing AWS EC2 key pair path to use"
  type        = string
}