#!/bin/bash
sudo curl -fsSl https://get.docker.com -o install_docker.sh
sudo chmod +x install_docker.sh

#installing and starting jenkins on docker. Jenkins will exposed on port 80 on host machine
sudo sh install_docker.sh
sudo docker run --name jenkins -d -p 80:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

#to get the admin password for completing installation
#sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

#to stop jenkins
#sudo docker container stop jenkins