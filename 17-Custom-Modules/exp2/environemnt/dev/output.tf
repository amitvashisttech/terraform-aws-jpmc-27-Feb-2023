output "frontend-PIP" { 
  value = module.frontend.publicip
}


output "frontend-PvtIP" { 
  value = module.frontend.privateip
}


output "backend-PIP" { 
  value = module.backend.publicip
}


output "backend-PvtIP" { 
  value = module.backend.privateip
}



/*
output "backend" { 
  vaule = ""
}
*/
