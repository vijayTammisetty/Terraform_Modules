provider "aws" {
  
}

resource "aws_vpc" "CVPC" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = ""
    }
  
}

resource "aws_internet_gateway" "IG" {
    vpc_id = aws_vpc.CVPC.id
  
}

resource "aws_subnet" "PSub" {
    vpc_id = aws_vpc.CVPC.id
    cidr_block = var.sub_cidr #"10.0.0.0/24"
    map_public_ip_on_launch =var.map_public_ip_on_launch  #true

  
}

resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.CVPC.id
    route {
        cidr_block = var.route_table_cidr
        gateway_id = aws_internet_gateway.IG.id
    }
  
}

resource "aws_route_table_association" "RTA" {
    subnet_id = aws_subnet.PSub.id
    route_table_id = aws_route_table.RT.id
}

resource "aws_key_pair" "My-key" {
  key_name =var.key_name   #"modules"
  public_key = var.public_key_pair            #file("C:/Users/vijaya kumar/.ssh/id_rsa.pub")
}

resource "aws_security_group" "sec_gp" {
  name =var.sg_name    #"CSG"
  vpc_id = aws_vpc.CVPC.id

  ingress {
    description = "SSH from VPC"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr]      #["0.0.0.0/0"]
  }
    ingress {
    description = "HHTP from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr]
  }
    ingress {
    description = "HTTPS from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [var.sg_egress_cidr]
  }

}

resource "aws_instance" "My-instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.My-key.key_name
    subnet_id = aws_subnet.PSub.id
    security_groups = [aws_security_group.sec_gp.id]
    tags = {
      Name = ""
    }

    /*
    connection {
      type = "ssh"
      user = var.ssh_user
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }
    */

    # Local Execution Process
    /*
    provisioner "local-exec" {
        command = "touch file100"
      
    }
    */

    # remote execution process
    /*
    provisioner "remote-exec" {
        inline = [
        "touch file200",
        "echo hello from aws >> file200",
        ]  
    } 
    */

    
}