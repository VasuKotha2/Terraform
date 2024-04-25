module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

 # VPC Details
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs = var.vpc_availability_zones
  private_subnets = var.vpc_public_subnets
  public_subnets = var.vpc_private_subnets

  #Database subnets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  
  #NAT gateways - outbound communication 
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  #VPC DNS paramter
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Name = "public-subnets"
  }

  private_subnet_tags = {
    Name = "private-subnets"
  }

  database_subnet_tags = {
    Name = "database-subnets"
  }

  tags = {
    Owner = "amazon"
    Environmet = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }
  

}


