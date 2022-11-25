#!/bin/bash


# 기관명(group_name) 받아오기(설정 바꿔줘야함)
echo "Enter the group name: "
read group_name
echo "$group_name's moodle will be made!"


# 기관명으로 테라폼 파일 돌리기 (config 파일 정의 필수)
cp -r original_terraform/ $group_name
cd $group_name
echo "
# terraform.auto.tfvars
vpc_name     = \"${group_name}-vpc\"
vpc_cidr     = \"192.168.0.0/16\"
cluster_name     =\"${group_name}\"
cluster_version  = \"1.20\" " > terraform.auto.tfvars
echo "
resource \"aws_db_subnet_group\" \"sub_ids\" {
  name = \"${group_name}ss\"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = \"DB subnet group\"
  }
}" >> rds.tf

# 테라폼 적용
terraform init
terraform plan
terraform apply -auto-approve
# 분명 config 권한이 없어서 오류가 날테니 다시 config 정의
aws eks --region ap-northeast-1 update-kubeconfig --name $group_name --kubeconfig ~/.kube/$group_name
cp ~/.kube/$group_name /root/.kube/config


# terraform apply 한번 더 + rds의 endpoint 받아와서 rds address에 저장
terraform apply -auto-approve > output.txt
awk '/rds.amazonaws.com/' output.txt > c.txt
sed 's/["]//g' c.txt > d.txt
rds_address=$(awk '{print $4}' d.txt)
echo "rds address is '$rds_address'"

# loadbalancer 주소 받아와서 moodle_address에 저장
kubectl get svc > a.txt
awk '/moodle/ {print $4 > "b.txt"}' a.txt
moodle_address=$(cat b.txt)
echo "moodle address is '$moodle_address'"