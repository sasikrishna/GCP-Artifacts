## Setting up jenkins with docker on compute engine instance(VM)
- This guide can help you to install jenkins on VM using [docker-jenkins image](https://hub.docker.com/_/jenkins/) with just one simple command.
- In this tutorial, we are using GCP deployment manager to create a VM and a firewall rule to allow incoming traffic to jenkins on port# 80.
- We are using gcloud SDK to create the deployment and resource details are configured in launch-jenkins-vm.yaml file.
- Right after creating these resources, we need to install docker and run jenkins within it 
but we can automate this step by providing metadata attribute called startup-script-url(**refer launch-jenkins-vm.yaml**) in the VM configuration which points to our shell script containg instructions to install docker and running jenkins in it. Please check install_docker_jenkins.sh shell script for reference. This shell script is stored in cloud storage and we are using this URL for startup-script-url.
- Below is the gcloud command that does setting up the jenkins in few minutes.
  ```
  gcloud deployment-manager deployments create launch-jenkins --config launch-jenkins-vm.yaml
  ```
- After executing above command below are the list of things that happens.
  - Creates a virtual machine and installs docker and run jenkins after VM booting is completed.
  - Creates a firewall rule with a tag called "allow-http". Whichever VMs have this "allow-http" tag this firewall rule will be applied on it.
- **Note**: All though we can do everything from the cloud console, this is good for couple of reasons like automation, changing configuration at ease and provisioning environments in later times using same yaml file.
