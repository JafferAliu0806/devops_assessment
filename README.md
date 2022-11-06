

### Below are points for future improvements. 
1.	 As it is a stateless application we can containerize and deploy it on a serverless platform like App runner, Lambda, or Fargate (we may save some cost)

2.	In the current setup, it may take some time to reflect the new changes so we can use ansible to deploy the latest changes from the jump server which can access servers in the private subnet.

3.	If the jump server is not feasible, we set up a python API on the target server, when we invoke the API the files will download from S3 and restart services

CICD - Status 

[![main](https://github.com/JafferAliu0806/devops_assessment/actions/workflows/main.yml/badge.svg?branch=Master)](https://github.com/JafferAliu0806/devops_assessment/actions/workflows/main.yml)
