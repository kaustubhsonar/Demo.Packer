packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# variables 
variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}


locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}


source "amazon-ebs" "ubuntu" {
  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
  ami_name      = "learn-packer-linux-aws-v1-${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami    = "ami-0f5ee92e2d63afc18"
  ssh_username  = "ubuntu"
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  provisioner "shell" {
    inline = [
      "sudo sleep 10",
      "pwd",
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "sudo ufw allow proto tcp from any to any port 22,80,443",
    ]
  }

   provisioner "file" {
    source      = "app/test.txt"
    destination = "/tmp/test.txt"
  }

  #  post-processor "vagrant" {}
  #  post-processor "compress" {}

}

