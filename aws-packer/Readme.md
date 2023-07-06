## Commands
- packer init aws-ubuntu.pkr.hcl
- packer fmt aws-ubuntu.pkr.hcl 
- packer validate -var-file=variables.json aws-ubuntu.pkr.hcl
- packer build -var-file=variables.json aws-ubuntu.pkr.hcl