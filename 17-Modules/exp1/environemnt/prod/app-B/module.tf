module "frontend" { 
  source = "../../../modules/ec2"
  name = "Frontend-Node"
  env  = "Production"
  ec2_count = var.frontend_ec2_count 
}




module "backend" { 
  source = "../../../modules/ec2"
  ec2_count = var.backend_ec2_count 
  name = "Backend-Node"
  env  = "Production"
}
