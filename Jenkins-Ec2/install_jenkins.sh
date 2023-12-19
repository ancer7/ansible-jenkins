#!/bin/bash
exec > >(tee -i /var/log/user-data.log)
exec 2>&1
sudo apt update -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y
sudo apt install git -y 
mkdir ~/Ansible && cd Ansible
git clone https://github.com/ancer7/ansible-jenkins.git
cd Ansible
ansible-playbook -i localhost Jenkins-playbook.yml
sudo apt install python3 -y
sudo apt install ansible-core -y
sudo apt install python3-pip -y
sudo pip3 install boto boto3 -y
sudo apt-get install python3-boto -y
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y



