# Prerequisites
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
```


# Install Packer 
```
sudo yum -y install packer
```

# Verify Packer
```
packer --version
```





# WorkAround 
```
 1389  wget https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_linux_amd64.zip
 1390  unzip packer_1.8.6_linux_amd64.zip
 1391  ls
 1392  ./packer --version
 1393  cp -rf packer /usr/sbin/packer
 1394  packer --version
```
