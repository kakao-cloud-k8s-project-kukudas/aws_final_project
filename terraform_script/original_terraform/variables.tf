variable "region" {
  default = "ap-northeast-1"
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type = list(string)
  default = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

variable "cluster_name" {
  description = "Cluster Name"
  type = string
  default = null
}

variable "cluster_version" {
  description = "Cluster Version"
  type = string
  default = null
}

variable "vpc_cidr" {
  description = "VPC CIDR Range"
  type = string
  default = null
}

variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = null
}
variable "database_name" {
  description = "database name"
  type = string
  default = null
}
variable "database_group" {
  description = "databse group"
  type = string
  default = null
}
variable "pvc_name" {
  description = "pvc_name"
  type = string
  default = null
}
variable "replica_name1" {
  description = "replica name1"
  type = string
  default = null
}
variable "replica_name2" {
  description = "replica name2"
  type = string
  default = null
}

#grafana 
variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "create_namespace_prometheus" {
  type        = bool
  default     = true
  description = "Whether to create Prometheus Kubernetes namespace with name defined by `namespace`."
}

variable "create_namespace_grafana" {
  type        = bool
  default     = true
  description = "Whether to create Grafana Kubernetes namespace with name defined by `namespace`."
}

variable "namespace_prometheus" {
  type        = string
  default     = "prometheus"
  description = "Kubernetes namespace to deploy Prometheus stack Helm charts."
}

variable "namespace_grafana" {
  type        = string
  default     = "grafana"
  description = "Kubernetes namespace to deploy Grafana stack Helm charts."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

# Prometheus

variable "settings_prometheus" {
  default = {
    alertmanager = {
      persistentVolume = {
        storageClass = "gp2"
      }
    }
    server = {
      persistentVolume = {
        storageClass = "gp2"
      }
    }
  }
  description = "Additional settings which will be passed to Prometheus Helm chart values."
}

variable "helm_chart_prometheus_release_name" {
  type        = string
  default     = "prometheus"
  description = "Prometheus Helm release name"
}

variable "helm_chart_prometheus_name" {
  type        = string
  default     = "prometheus"
  description = "Prometheus Helm chart name to be installed"
}

variable "helm_chart_prometheus_version" {
  type        = string
  default     = "14.7.2"
  description = "Prometheus Helm chart version."
}

variable "helm_chart_prometheus_repo" {
  type        = string
  default     = "https://prometheus-community.github.io/helm-charts"
  description = "Prometheus repository name."
}

# Grafana

variable "settings_grafana" {
  default = {
    persistence = {
      enabled          = true
      storageClassName = "gp2"
    }
    adminPassword = "admin"
  }
  description = "Additional settings which will be passed to Grafana Helm chart values."
}

variable "helm_chart_grafana_release_name" {
  type        = string
  default     = "grafana"
  description = "Grafana Helm release name"
}

variable "helm_chart_grafana_name" {
  type        = string
  default     = "grafana"
  description = "Grafana Helm chart name to be installed"
}

variable "helm_chart_grafana_version" {
  type        = string
  default     = "6.44.10"
  description = "Grafana Helm chart version."
}

variable "helm_chart_grafana_repo" {
  type        = string
  default     = "https://grafana.github.io/helm-charts"
  description = "Grafana repository name."
}
