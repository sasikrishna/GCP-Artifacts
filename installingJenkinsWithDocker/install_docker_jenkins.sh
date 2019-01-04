#!/bin/bash

#installing docker from https://get.docker.com is not recommened for production environments but this is fine for demo and iilustrations purposes.
sudo curl -fsSl https://get.docker.com -o install_docker.sh
sudo chmod +x install_docker.sh
sudo sh install_docker.sh

#running jenkins container in docker. Provided container name as jenkins for identification. Mapped container port 8080 to host machine
#port 80. Jenkins runs on port 8080 in container which is mapped to port 80 in host machine.
#Also we are mapping container jenkins storage volume to host machine at /var/jenkins_home location. So even if container is deleted, we'll have all jenkins file.
sudo docker run --name jenkins -d -p 80:8080 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

#to get the admin password for completing installation
#sudo docker exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword

#to stop jenkins
#sudo docker container stop jenkins
