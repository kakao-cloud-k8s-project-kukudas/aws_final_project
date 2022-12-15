#!/bin/bash

name=$1
user_name=$2

echo "eks cluster name: $name"
cd /root/aws_final_project/terraform_script/$name



terraform destroy -auto-approve > /root/aws_final_project/terraform_script/destroy.txt
# terraform destroy 삭제 결과

if [ $? == "0" ]; then
    echo 20
    cd ..
    rm -rf /root/aws_final_project/terraform_script/$name
    
    # 삭제됨으로 주소 삭제 및 클러스터 여부 없앰
    echo "UPDATE Account_user_info SET lb_address=NULL, grafana_address=NULL, cluster_exist=0 WHERE company_name='$user_name';" | mysql -N -uadmin -ptest1234 -h django-mysql.cm78essrody9.ap-northeast-1.rds.amazonaws.com django;

elif [ $? == "1" ]; then
    echo "ERROR" >> /root/aws_final_project/terraform_script/destroy.txt
    exit 1
else
    echo "ANT ERROR" >> /root/aws_final_project/terraform_script/destroy.txt
fi
