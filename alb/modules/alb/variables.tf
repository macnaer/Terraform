variable "regios" {
  type    = string
  default = "eu-north-1"
}

variable "a-zone" {
  type    = string
  default = "eu-north-1a"
}

variable "ami-id" {
  type    = string
  default = "ami-0fa91bc90632c73c9"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "Stockholm_2"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for Auto Scaling Group"
  type        = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for Auto Scaling Group"
  type        = list(string)
}

variable "ami_id" {
  type    = string
  default = "ami-0fa91bc90632c73c9"
}
