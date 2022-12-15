#!/bin/bash

# 기관명 (group_name) 받아오기(설정 바꿔줘야함)
group_name=$1
echo "$group_name's moodle will be made!"
user_name=$2
echo "Username : $user_name"

cd /root/aws_final_project/terraform_script/
# 기관명으로 테라폼 파일 만들고 돌리기 위한 준비
cp -r original_terraform/ $group_name
cd $group_name
# 변수 바꾸기
echo "
# terraform.auto.tfvars
vpc_name     = \"${group_name}-vpc\"
vpc_cidr     = \"192.168.0.0/16\"
cluster_name     =\"${group_name}\"
cluster_version  = \"1.21\"
database_name = \"${group_name}db\"
database_group = \"${group_name}gp\"
pvc_name = \"${group_name}pvc\"
replica_name1 = \"${group_name}db1\"
replica_name2 = \"${group_name}db2\"" > terraform.auto.tfvars

# 테라폼 적용
echo "terraform init"
terraform init

echo "terraform plan"

terraform plan

aws eks --region ap-northeast-1 update-kubeconfig \
    --name ${group_name}

echo "terraform approve"
terraform apply -auto-approve

aws eks --region ap-northeast-1 update-kubeconfig \
    --name ${group_name}

# Terraform apply Success
# loadbalancer 주소 받아와서 moodle_address에 저장
moodle_address=$(kubectl get svc | grep moodle | gawk '{print $4}')
echo "moodle address is '$moodle_address'"

# grafana 주소 저장
grafana_address=$(kubectl get svc -A | grep grafana | gawk '{print $5}')/d/rYdddlPWk/node-exporter-full?orgId=1
echo "grafana address is '$grafana_address'"

# DB UPDATE
echo "UPDATE Account_user_info SET lb_address='$moodle_address', grafana_address='$grafana_address/d/rYdddlPWk/node-exporter-full?orgId=1', cluster_exist=1 WHERE company_name='$user_name';" | mysql -N -uadmin -ptest1234 -h django-mysql.cm78essrody9.ap-northeast-1.rds.amazonaws.com django;
