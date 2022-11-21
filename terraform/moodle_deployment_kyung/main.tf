provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Terraform = "true"
      Project   = "${var.cluster_name}-project"
    }
  }
}
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  config_path = "~/.kube/config"
}
