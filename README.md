


### Below steps can perform to perviosion the infrastructure. 

1. clone the repo 
2. cd terrafrom_code 
3. make the changes on tf files as names are self explanatory. if we need to change the min number of server in LB the update the count on variable.tf 
4. commit the code and Git action will take care of the infrastructure provision
5 if you like to manually provision the infra then below steps can be performed
   a. terraform init 
   b terraform plan -output tf.plan --> this can be shared with the team and get the confirmation
   c. terraform apply tf.plan



### Scenario 1

### Below are points for future improvements. 
1.	 As it is a stateless application we can containerize and deploy it on a serverless platform like App runner, Lambda, or Fargate (we may save some cost)

2.	In the current setup, it may take some time to reflect the new changes so we can use ansible to deploy the latest changes from the jump server which can access servers in the private subnet.

3.	If the jump server is not feasible, we set up a python API on the target server, when we invoke the API the files will download from S3 and restart services

CICD - Status 

[![main](https://github.com/JafferAliu0806/devops_assessment/actions/workflows/main.yml/badge.svg?branch=Master)](https://github.com/JafferAliu0806/devops_assessment/actions/workflows/main.yml)


### Scenario 2

For application deployment, I have created the docker file and manifest. I have enclosed the screenshot for all the steps and the code is the task2 directory 
