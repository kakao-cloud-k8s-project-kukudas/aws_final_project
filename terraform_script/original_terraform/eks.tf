data "aws_caller_identity" "current" {}

locals {
  node_group_name        = "${var.cluster_name}-node-group"
  # iam_role_policy_prefix = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy"
}

module "eks" {
  # 모듈 사용
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  
  # 관리형 노드 그룹 사용 (기본 설정)
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64" # 
    disk_size              = 10           # EBS 사이즈
    instance_types         = ["t2.medium"]
    # vpc_security_group_ids = [aws_security_group.additional.id]
    vpc_security_group_ids = [aws_security_group.secrgrp_moodle.id]

    # cluster-autoscaler에 사용 될 IAM 등록
    # iam_role_additional_policies = ["${local.iam_role_policy_prefix}/${module.iam_policy_autoscaling.name}"]
  }

  # 관리형 노드 그룹 사용 (노드별 추가 설정)
  eks_managed_node_groups = {
    ("${var.cluster_name}-node-group-1") = {
      # node group 스케일링
      min_size     = 1# 최소
      max_size     = 10 # 최대
      desired_size = 3 # 기본 유지

      # 생성된 node에 labels 추가 (kubectl get nodes --show-labels로 확인 가능)
      labels = {
        ondemand = "true"
      }

      # 생성되는 인스턴스에 tag추가
      tags = {
        "k8s.io/cluster-autoscaler/enabled" : "true"
        "k8s.io/cluster-autoscaler/${var.cluster_name}" : "true"
      }
    }
    # ("${var.cluster_name}-node-group-2") = {
    #   # node group 스케일링
    #   min_size     = 1 # 최소
    #   max_size     = 4 # 최대
    #   desired_size = 1 # 기본 유지

    #   # 생성된 node에 labels 추가 (kubectl get nodes --show-labels로 확인 가능)
    #   labels = {
    #     ondemand = "true"
    #   }

    #   # 생성되는 인스턴스에 tag추가
    #   tags = {
    #     "k8s.io/cluster-autoscaler/enabled" : "true"
    #     "k8s.io/cluster-autoscaler/${var.cluster_name}" : "true"
    #   }
    # }

    # ("${var.cluster_name}-node-group-3") = {
    #   # node group 스케일링
    #   min_size     = 1 # 최소
    #   max_size     = 4 # 최대
    #   desired_size = 1 # 기본 유지

    #   # 생성된 node에 labels 추가 (kubectl get nodes --show-labels로 확인 가능)
    #   labels = {
    #     ondemand = "true"
    #   }

    #   # 생성되는 인스턴스에 tag추가
    #   tags = {
    #     "k8s.io/cluster-autoscaler/enabled" : "true"
    #     "k8s.io/cluster-autoscaler/${var.cluster_name}" : "true"
    #   }
    # }
  }
}
