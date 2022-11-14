#!/bin/bash
echo "Enter the eks name: "
read name
echo "eks cluster name: $name"
cp -r terraformprj/ $name
rm -rf terraform.auto.tfvars  terraform.tfstate.backup terraform.tfstate.d   
cd $name
echo "
# terraform.auto.tfvars
vpc_name     = \"${name}-vpc\"
vpc_cidr     = \"192.168.0.0/16\"

cluster_name     =\"${name}\"
cluster_version  = \"1.20\" " > terraform.auto.tfvars

terraform init
terraform workspace new $name
terraform plan
