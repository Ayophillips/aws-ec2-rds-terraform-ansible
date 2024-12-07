variable "aws_region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "db_password" {
  description = "RDS root password"
  sensitive   = true
}

variable "ami" {
  description = "AMI ID to use for EC2 instances"
  default     = "ami-0453ec754f44f9a4a"
}
