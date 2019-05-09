#!/bin/bash

# Install 'curl' and 'rpm'
sudo yum install curl rpm -y

#Install OpenJDK 8
sudo yum install java-1.8.0-openjdk-devel -y

#Enable Jenkins Repository
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

#Install Jenkins
sudo yum install jenkins -y

#Start Jenkins
sudo systemctl start jenkins

#Enable Jenkins
sudo systemctl enable jenkins

#Adjust firewalls
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
