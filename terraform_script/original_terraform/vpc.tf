module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  enable_dns_hostnames                 = true
  name = var.vpc_name
  azs  = data.aws_availability_zones.available.names
  #cidr = var.vpc_cidr
  cidr = "10.0.0.0/16"


  # NAT게이트웨이를 생성합니다.
  enable_nat_gateway = true
  # NAT게이트웨이를 1개만 생성합니다.
  single_nat_gateway = true

  #public_subnets = [for index in range(3):
  #                    cidrsubnet(var.vpc_cidr, 4, index)]

  #private_subnets = [for index in range(3):
  #                    cidrsubnet(var.vpc_cidr, 4, index + 3)]

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}