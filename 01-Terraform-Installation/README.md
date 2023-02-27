# Install Terraform

## Install Git Utils 
```
sudo yum install git -y 
```

## Install Yum Utils 
```
sudo yum install -y yum-utils
```

## Add Terraform repo
```
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
```

## Install Terraform
```
sudo yum -y install terraform
```

## Verfiy Terraform
```
sudo terraform version
```

## Now export the AWS Keys into Env. Variables
```
echo "export AWS_ACCESS_KEY_ID="XXXXXXXXXXXX" " >> ~/.bashrc
```

```
echo "export AWS_SECRET_ACCESS_KEY="XXXXXXYYYYYYYYYYYYYYYYYYYYYYYYYYY" " >>  ~/.bashrc
```

```
source ~/.bashrc
```

```
set | grep -i AWS
```

