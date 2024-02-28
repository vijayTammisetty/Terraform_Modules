module "Apple" {
    source = "../source"
    vpc_cidr = "10.0.0.0/16"
    sub_cidr = "10.0.0.0/25"
    map_public_ip_on_launch = true
    route_table_cidr = "0.0.0.0/0"
    key_name = "module_key"
    public_key_pair = file("C:/Users/vijaya kumar/.ssh/id_rsa.pub")
    sg_name = "Custom_security"
    ingress_cidr = "0.0.0.0/0"
    sg_egress_cidr = "0.0.0.0/0"
    ec2_name = "apple"
    ami_id = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"

    # instance connection
    #ssh_user = "ec2-user"

  
}