#versions.tf
/*
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.0"
    }
  }
}
*/

#Part of the main.tf $ dns.tf
#main.tf
# Route53 deployment provider (management account)
/*
provider "aws" {
  region = ap-south-1
  alias  = "route53"
}
*/

/*
module "dns" {
  source = "./dns"
  providers = {
    aws         = aws
    aws.route53 = aws.route53
  }
  */

#dns.tf
# Create R53 alias records for all fileservers


/*
resource "aws_route53_record" "fileserver" {
  for_each = var.map_uid_dns__instances

  provider = aws.route53
  zone_id  = data.aws_route53_zone.dns_zone.id
  name     = format("%s%s", each.key, var.dns_env_suffix)
  type     = "A"
  ttl      = "300"
  records = [
    each.value,
  ]
}
*/