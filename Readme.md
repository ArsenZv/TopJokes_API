# Top Jokes REST API #

This is a small test project where I created a siple python microservise that pull 100 latest jokes/posts
from bash.org.pl. Then forms them into a JSON file and serves them to the outside. The service is running
in a docker container and can be build, deployed and turned off usign Jenkins.

## Steps performed: ##

* Created a microservice serving REST API with GET calls returning 100jokes starting from the newest from bash.org.pl in JSON format;

* Service could be created and launched in Docker container.

* Created Terraform code for provisioning custom VPC + EC2 and properSecurity Groups to allow access to the services from the Internet using specific ports (for example to execute curl to get the response or reach Jenkins)

* Created Ansible playbook to install required libraries, os updates and tools on the EC2 instance and Jenkins before the microservice deployment.

* Deployed the microservice on AWS EC2 using CI/CD (Jenkins).

## Access Details: ##

### Jenkins ###
Username:  | scalac
------------- | -------------
Password:  |  HeyJenkins!

You can reach it at:
[ec2-13-59-17-138.us-east-2.compute.amazonaws.com](http://ec2-13-59-17-138.us-east-2.compute.amazonaws.com:8080/)
Or if you prefer:
[13.59.17.138](http://13.59.17.138:8080/)


### REST API ###

**Port:** 2077
**IP:** 13.59.17.138
**Domain:** ec2-13-59-17-138.us-east-2.compute.amazonaws.com

Combined URL to use:
http://13.59.17.138:8080/
