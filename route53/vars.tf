variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}

variable "regions-eu" {
  type    = string
  default = "eu-north-1"
}

variable "regions-us" {
  type    = string
  default = "us-east-1"
}

variable "regions-apac" {
  type    = string
  default = "ap-south-1"
}

variable "ami-id-eu" {
  type    = string
  default = "ami-073130f74f5ffb161"
}

variable "ami-id-us" {
  type    = string
  default = "ami-0b6c6ebed2801a5cb"
}

variable "ami-id-apac" {
  type    = string
  default = "ami-019715e0d74f695be"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name-stockholm" {
  type    = string
  default = "Stockholm_2"
}
