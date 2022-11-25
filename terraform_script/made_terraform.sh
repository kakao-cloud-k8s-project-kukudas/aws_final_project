#!/bin/bash


# 기관명(group_name) 받아오기(설정 바꿔줘야함)
echo "Enter the group name: "
read group_name
echo "$group_name's moodle will be made!"


# 기관명으로 테라폼 파일 만들고 돌리기 위한 준비
cp -r original_terraform/ $group_name
cd $group_name
# 변수 바꾸기
echo "
# terraform.auto.tfvars
vpc_name     = \"${group_name}-vpc\"
vpc_cidr     = \"192.168.0.0/16\"
cluster_name     =\"${group_name}\"
cluster_version  = \"1.20\" 
database_name = \"${group_name}db\"
database_group = \"${group_name}gp\" " > terraform.auto.tfvars


# 테라폼 적용
terraform init && \
terraform plan && \
terraform apply -auto-approve && \
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)



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


#데이터베이스에 넣는 부분 필요