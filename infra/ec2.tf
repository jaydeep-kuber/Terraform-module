resource "aws_key_pair" "infra_kp" {
    key_name   = var.key_name
    public_key = var.public_key
}

resource "aws_default_vpc" "default" {
     
}

resource "aws_security_group" "infra_sg" {
    name        = "${var.env}-sg"
    description = "Security group for ${var.env} environment"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    tags = {
        Environment = var.env
        Name        = "${var.env}-sg"
    }
}

resource "aws_instance" "infra_ec2" {
    ami = var.ami_id
    instance_type = var.ec2_instance_type
    key_name = aws_key_pair.infra_kp.key_name
    security_groups = [aws_security_group.infra_sg.name]

    count = var.numer_of_instances
    
    depends_on = [ aws_default_vpc.default, aws_key_pair.infra_kp, aws_security_group.infra_sg ]

    user_data = file("install_nginx.sh") # Assuming this script is in the same directory, we are not making it dynamic i.e. taking from variable.

    root_block_device {
        volume_size = var.env == "dev" ? 8 : var.vulume_size
        volume_type = var.volume_type
    }
    tags = {
        Name        = "${var.env}-infra-ec2-${count.index + 1}"
        Environment = var.env
    }
}