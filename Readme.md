**Challenge- I**

We want to automate the deployment of mediawiki on docker/K8/OpenShift, we’d like to see code file.
  
We want to assess your learnability and your current knowledge of containerizing an application using an orchestration platform like K8/OpenShift.
Details

we’ll start with one instance of mediawiki running.
  
That’ll be backed by a database server (MySql/postgres) running on a separate container.
  
We expect this to be installed using these steps: Installing  HYPERLINK "https://www.mediawiki.org/wiki/Manual:Installing_MediaWiki"MediaWiki

Expectations:

Automated setup for the problem statement including the infrastructure setup using any IAC code (Terraform/Azure ARM Template/AWS Cloudformation/GCP) of your choice

Adopt best practices in the tools which you are using. For example- Proper syntax and naming, Modular code etc.
  
We expect your solution to be designed using orchestration tool of your choice e.g Openshift, Kubernetes (Use Any Hyperscaler PaaS) 
  
Brownie points if the application is running.

  **Guide**
  
  1. Terraform is used to setup the environment on the cloud (AWS)
  
  2. EC2 instance is spin-up and microk8s and docker are installed. 
  
  3. [mediawiki repo](https://github.com/ramakrishnakaushik97/mediawiki) is used to setup the mediawiki pod
  
      * Dockerfile has the instruction to copy the mediawiki files to the /var/www/html on apache2.
      * makefile has all the instruction to build the docker image and bring up mediawiki pod using microk8s.
  
 
