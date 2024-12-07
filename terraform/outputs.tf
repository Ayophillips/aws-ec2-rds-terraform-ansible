# outputs.tf
output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "instances" {
  value = {
    web      = module.web.public_ip
    backend  = module.backend.private_ip
    bastion  = module.bastion.public_ip
    database = aws_db_instance.main.endpoint
  }
}
