# variables 

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "source_ami"{
  type = string
  description= "Source ami for modification"
}

variable "region"{
  type = string
  description= "region"
}