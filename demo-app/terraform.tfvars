# Shared defaults for the demo app
aws_region   = "us-east-1"
environment  = "dev"
project_name = "demo-app"

vpc_cidr             = "10.20.0.0/16"
public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs = ["10.20.10.0/24", "10.20.11.0/24"]
availability_zones   = ["us-east-1a", "us-east-1b"]
enable_nat_gateway   = true

ec2_instance_type     = "t3.micro"
ec2_instance_count    = 1
ec2_key_name          = null
ec2_enable_encryption = true
