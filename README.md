
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


#### Kubernetes deployments.

Docker images can be build using task2/Dockerfile and push it to ECR

##### For DB deployment

1. clone the repo 
2. kubectl create ns sg-assessment --> create namespace 
3. mysql username and password can be created via from-file method  
5. cd task2/mysql-deployment
6. kubectl apply -f . 
7. verify resources are created by using - kubectl get -n sg-assessment all

#### For application deployment.

8. cd task2/app_deployment
9. kubectl apply -f . 
10. verify resources are created by using - kubectl get -n sg-assessment all --> we can see all resources were deployed .
11. expose the services using port forward - kubectl port-forward service/my-nginx 80:80 -n sg-assessment
12. screen shot are available on task2/SG_assessment_task2.docx
