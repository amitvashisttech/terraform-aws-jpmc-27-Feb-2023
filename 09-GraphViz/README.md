# Instroduction tp GraphViz Utility with Apache. 

## Install Apache & GraphViz Packages
```
yum install httpd graphviz -y 
service httpd start
```

## Go to the Resource Dir. & Genrate Terraform Graph. 
```
cd 04-Resource
terraform graph > resource.dot
```

## Convert the Resource DOT to SVG Formate.
```
dot resource.dot -Tsvg -o resource.svg
```

## Setup Apache For Hosting Graphviz Images 
```
mkdir -p /var/www/html/Terraform-Images
cp -rf resource.svg /var/www/html/Terraform-Images/01-resource.svg
curl ifconfig.me 
```
## Enable port 80 in a Security Group

## Now explore the Image in your web browser.

