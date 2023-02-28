terraform { 
  required_providers { 
   
    azurerm = { 
     source = "hashicorp/azurerm"
     version = ">=3.37, <=3.40"
    }
   
   aws = { 
     source = "hashicorp/aws"
     version = ">=3.40"
    }
 }
}
