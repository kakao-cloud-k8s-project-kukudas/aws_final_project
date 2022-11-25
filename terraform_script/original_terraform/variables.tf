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