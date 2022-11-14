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

#클러스터 초기 설정
aws eks --region ap-northeast-1 update-kubeconfig --name $name

#CA(cluster-autocaler) 설치
echo "
autoDiscovery:
  clusterName: ${name} # eks cluster name

awsRegion: ap-northeast-1 # eks region

extraArgs:
  logtostderr: true
  stderrthreshold: info
  v: 4
  expander: random
  scale-down-enabled: true " > values.yaml
helm repo add autoscaler <https://kubernetes.github.io/autoscaler>

helm repo update

helm install cluster-autoscaler autoscaler/cluster-autoscaler --values=./valuse.yaml
