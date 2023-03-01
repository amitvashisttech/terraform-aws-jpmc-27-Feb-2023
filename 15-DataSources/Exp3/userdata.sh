#!/bin/bash 
yum update -y 
yum install docker-${Docker_Version} ansible-${Ansible_Version} -y 
yum install ntp unzip jq
