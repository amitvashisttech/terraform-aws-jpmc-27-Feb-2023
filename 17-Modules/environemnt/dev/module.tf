module "frontend" { 
  source = "../../modules/ec2"
  name = "Demo-Frontend-Node"
  env  = "Development"
  ec2_count = var.frontend_ec2_count 
}




module "backend" { 
  source = "../../modules/ec2"
  ec2_count = var.backend_ec2_count 
  name = "Demo-Backend-Node"
  env  = "Development"
}
