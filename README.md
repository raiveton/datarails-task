
# Datarails Task

Here you can find all the steps for task completion


#### Part 1: Working with Docker

Clone repository, build and run:


`git@github.com:raiveton/datarails-task.git`

`docker build -t datarails-simple-app .`

`docker run -d -p 3000:3000 datarails-simple-app`

Dockerhub link for the image:

https://hub.docker.com/r/raiveton/datarails-simple-app


#### Part 3: Working with Helm and Terraform

I decided to use AWS EKS as k8s cluster. All tf files in "terraform folder" and you can add or reuse variables as needed.

1. Install and configure aws cli tool, manuals here:

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-user.html

2. Install terraform:

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

3. Install Helm

https://helm.sh/docs/intro/install/


4. Terraform init and apply infrastructure

`cd terraform`

`terraform init`

`terraform plan`

`terraform apply`


5. Deploy helm chart

`helm install hello-world-datarails-chart hello-world-datarails-chart-0.1.0.tgz`

