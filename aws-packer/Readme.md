## Commands
- packer init aws-ubuntu.pkr.hcl
- packer fmt aws-ubuntu.pkr.hcl 
- packer validate -var aws_access_key=<aws_access_key> -var aws_secret_key=<aws_secret_key> .
- packer build -var aws_access_key=<aws_access_key> -var aws_secret_key=<aws_secret_key> .