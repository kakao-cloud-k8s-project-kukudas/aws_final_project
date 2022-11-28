#!/bin/bash

aws iam create-policy \
    --policy-name AmazonEKSClusterAutoscalerPolicy \
    --policy-document file://cluster-autoscaler-policy.json


# arn 추가해줘야함
arn_name=$(terraform output -raw arn)
eksctl create iamserviceaccount \
  --cluster=eks-demo \
  --namespace=kube-system \
  --name=cluster-autoscaler \
  --attach-policy-arn=${arn_name} \
  --override-existing-serviceaccounts \
  --approve

# name에 cluster 이름 가져와야 함
name=$(terraform output -raw cluster_name)
sed "s/<YOUR CLUSTER NAME>/$name/g" cluster-autoscaler-autodiscover.yaml > cluster-autoscaler-autodiscover2.yaml
kubectl apply -f cluster-autosscaler-autodiscover2.yaml

kubectl patch deployment cluster-autoscaler \
  -n kube-system \
  -p '{"spec":{"template":{"metadata":{"annotations":{"cluster-autoscaler.kubernetes.io/safe-to-evict": "false"}}}}}'

kubectl -n kube-system edit deployment.apps/cluster-autoscaler
sed -i'' -r -e "/volumeMounts/i\            - --skip-nodes-with-system-pods=false" cluster-autoscaler-autodiscover2.yaml
sed -i'' -r -e "/volumeMounts/i\            - --balance-similar-node-groups" cluster-autoscaler-autodiscover2.yaml 

kubectl set image deployment cluster-autoscaler \
  -n kube-system \
  cluster-autoscaler=k8s.gcr.io/autoscaling/cluster-autoscaler:v1.20