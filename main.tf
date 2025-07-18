module "dev-infra" {
    source = "./infra"

    env = "dev"
    
    bucket_name = "dev-bucket-9825215"
    
    key_name = "aws-dev-kp"
    public_key = file("./aws-dev-kp.pub")

    ec2_instance_type = "t2.micro"
    ami_id = "ami-0f918f7e67a3323f0"
    numer_of_instances = 1
    vulume_size = 8
    volume_type = "gp2"
}