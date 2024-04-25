# VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}

# VPC CIDR block

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

# VPC Private subnets

output "private_subnets" {
  value = module.vpc.private_subnets
}
# VPC public subnets

output "public_subnets" {
  value = module.vpc.public_subnets
}

# NAT gateway

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

# VPC Azs

output "azs" {
  value = module.vpc.azs
}