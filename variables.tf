variable "my_ip" {
  description = "IP block allowed to SSH into the instance"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  sensitive   = true
}

variable "iam_instance_profile" {
  description = "IAM instance profile for the EC2 instance"
  type        = string
  sensitive   = true
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
  sensitive   = true
}
