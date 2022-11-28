provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "cluster-autoscaler" {
  name       = "cluster-autoscaler"
  repository = "https://kubernetes.github.io/autoscaler"
  chart      = "cluster-autoscaler"
  
  values = [
    file("${path.module}/cluster-autoscaler-values.yaml")
  ]

  set { 
    name = "autoDiscovery.clusterName"
    value = module.eks.cluster_name
  }

  set { 
    name = "awsRegion" 
    value = var.region
  } 
}

