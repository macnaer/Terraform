variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "ec2_sg_id" {
  type = string
}

variable "ami_id" {
  type    = string
  default = "ami-0fa91bc90632c73c9"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for Auto Scaling Group"
  type        = list(string)
}
