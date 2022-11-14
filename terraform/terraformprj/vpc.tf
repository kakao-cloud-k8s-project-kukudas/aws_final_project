# vpc.tf
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  azs  = var.azs
  cidr = var.vpc_cidr

  # NAT게이트웨이를 생성합니다.
  enable_nat_gateway = true
  # NAT게이트웨이를 1개만 생성합니다.
  single_nat_gateway = true

  public_subnets = [for index in range(2):
                      cidrsubnet(var.vpc_cidr, 4, index)]

  private_subnets = [for index in range(2):
                      cidrsubnet(var.vpc_cidr, 4, index + 2)]
}