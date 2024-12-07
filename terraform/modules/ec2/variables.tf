variable "ami" {
  description = "The AMI to use for the instance"
}

variable "instance_type" {
  description = "The type of instance to create"
}

variable "subnet_id" {
  description = "The subnet in which to place the instance"
}

variable "security_group_ids" {
  description = "The security groups to assign to the instance"
  type        = list(string)
}

variable "key_name" {
  description = "The SSH key name to associate with the instance"
}

variable "volume_size" {
  description = "The size of the root volume"
  default     = 20
}

variable "instance_name" {
  description = "Name tag for the instance"
}
