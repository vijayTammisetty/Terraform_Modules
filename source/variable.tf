#  Custom vpc name
variable "vpc_name" {
    type = string
    default = ""
  
}

# vpc cidr block
variable "vpc_cidr" {
  type = string
  default = ""
}
variable "IG_name" {
    type = string
    default = ""
  
}

# subnet cidr block
variable "sub_cidr" {
    type = string
    default = ""
  
}
variable "map_public_ip_on_launch" {
    type = bool
    default = false
  
}
variable "route_table_cidr" {
    type = string
    default = ""
  
}

variable "key_name" {
    type = string
    default = ""
  
}

variable "public_key_pair" {
    default = ""
  
}


variable "sg_name" {
    type = string
    default = ""
  
}

variable "ingress_cidr" {
    type = string
    default = ""
  
}

variable "sg_egress_cidr" {
    type = string
    default = ""
  
}


# instance Name
variable "ec2_name" {
    type = string
    default = ""
  
}
# Instance Id
variable "ami_id" {
    type = string
    default = ""
  
}

# instance Type
variable "instance_type" {
    type = string
    default = ""
  
}

# ec2 connection
variable "ssh_user" {
    type = string
    default = ""
  
}