provider "aws" {
    region = "ap-south-1"
}
module "vpc" {
    source = "github.com/SyedAzherAli/TF-AWS-modules/vpc"
}
module "security_group" {
    source = "github.com/SyedAzherAli/TF-AWS-modules/security_group" 

    sg_vpc_id = module.vpc.vpc_id
}
module "Jenkins-server" {
    source = "github.com/SyedAzherAli/TF-AWS-modules/ec2"

    key_name = "EC2_KeyPair"                        // Replace with your key pair name 
    subnet_id = module.vpc.subnet01_id
    security_group_id = module.security_group.security_group_id
    instance_type = "t2.xlarge"
    user_data = "./tools.sh"
    volume_size = 25
}