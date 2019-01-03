## Setting up jenkins with docker on compute engine instance(VM)
- This guide can help you to install jenkins on VM using [docker-jenkins image](https://hub.docker.com/_/jenkins/) with a simple command execution.
- In this tutorial we are using GCP deployment manager to create a VM and a firewall rule to allow incoming traffic to jenkins on port# 80.
- We are using gcloud SDK to create the deployment and resource details are configured in launch-jenkins-vm.yaml file.
- Right after creating these resources we need to install docker and run jenkins within it. 
We can automate this step by providing metadata attribute called startup-script-url(**refer launch-jenkins-vm.yaml**) when creating VM which points to our 
shell script containg instructions to install docker and running jenkins. Please check install_docker_jenkins.sh shell script for reference.
- Below is the gcloud command that does setting up the jenkins in few minutes.
  ```
  gcloud deployment-manager deployments create launch-jenkins --config launch-jenkins-vm.yaml
  ```
