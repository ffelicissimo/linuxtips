module "servers" {
  source = "./servers"
  servers = 2
}

module "tunnel" {
  source = "./tunnel"
  providers = {
    aws.east = "aws.east"
    aws.west = "aws.west"
  }
}

output "ip_address" {
    value = "module.servers.ip_address"
}

#resource "aws_route53_record" "server" {
  #zone_id = "id da sua zone"
  #name = "server"
  #type = "A"
  #ttl = "300"
  #records = [module.servers.ip_address[|0]]
#}