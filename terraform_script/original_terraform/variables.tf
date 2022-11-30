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