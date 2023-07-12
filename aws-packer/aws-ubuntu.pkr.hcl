packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "amazon-ebs" "ubuntu" {
  access_key    = var.aws_access_key
  secret_key    = var.aws_secret_key
  ami_name      = "learn-packer-linux-aws-v1-${local.timestamp}"
  instance_type = "t2.micro"
  region        = var.region
  source_ami    = var.source_ami
  ssh_username  = "ubuntu"
}

build {
  name = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  # provisioner "shell" {
  #   inline = [
  #     "sudo sleep 10",
  #     "pwd",
  #     "sudo apt update",
  #     "sudo apt install nginx -y",
  #     "sudo systemctl enable nginx",
  #     "sudo systemctl start nginx",
  #     "sudo ufw allow proto tcp from any to any port 22,80,443",
  #   ]
  # }

  provisioner "shell" {
    environment_vars = ["PROVISIONERTEST=ProvisionerTest1"]
    scripts          = ["aws-packer/scripts/install-tools.sh"]
  }

  # provisioner "file" {
  #   source      = "app/test.txt"
  #   destination = "/tmp/test.txt"
  # }

  #  post-processor "vagrant" {}
  #  post-processor "compress" {}

}

