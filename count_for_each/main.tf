provider "aws" {
  
}

# Count is used to create multiple resources
# count will follow the indexing
# while creating it will create assending order
# if you want to delete any one resource it follow dissending order


# resource "aws_instance" "count" {
#     ami = "ami-0440d3b780d96b29d"
#     instance_type = "t2.micro"
#     key_name = "tuesday"
#     count = length(var.tags)

#     tags = {
#       Name = var.tags[count.index]
#     } 
# }

resource "aws_instance" "count" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t2.micro"
    key_name = "tuesday"
    # count = length(var.tags)
    for_each = toset(var.tags)

    tags = {
      Name = each.value
    } 
}


