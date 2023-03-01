locals { 
  default = timestamp()
}

output "time" { 
  value = local.default
}



locals { 
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

output "time2" { 
  value = local.time
}
 
