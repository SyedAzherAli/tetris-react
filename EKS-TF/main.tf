provider "aws" {
  region = "ap-south-1"
}
module "vpc" {
  source = "github.com/SyedAzherAli/TF-AWS-modules/vpc"
}

module "eks" {
  source = "github.com/SyedAzherAli/TF-AWS-modules/eks"
  key_name = var.key_name                                                       // Replace with your key pair name 
  sg_vpc_id = module.vpc.vpc_id
  controller_subnet_ids = [module.vpc.subnet01_id, module.vpc.subnet02_id]
  worker_subnet_ids = [module.vpc.subnet03_id, module.vpc.subnet04_id]

  scaling_config = {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }
}