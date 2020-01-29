module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = "172.16.0.0/16"

  azs = [
    "eu-west-1a",
    "eu-west-1b",
    "eu-west-1c"
  ]

  private_subnets = [
    "172.16.11.0/24",
    "172.16.12.0/24",
    "172.16.13.0/24"
  ]

  public_subnets = [
    "172.16.111.0/24",
    "172.16.112.0/24",
    "172.16.113.0/24"
  ]

  enable_nat_gateway = false

  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true
  enable_dns_hostnames                   = true
  enable_dns_support                     = true

  enable_vpn_gateway  = false
  enable_s3_endpoint  = false
  enable_ec2_endpoint = false

  tags = {
    Name        = var.vpc_name
    Terraform   = "true"
    Environment = var.env_name
  }

}