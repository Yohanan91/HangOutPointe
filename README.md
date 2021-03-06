
PG DO - DevOps Capstone Project

DESCRIPTION

Create an automated test environment for continuous evaluation of the application.

Background of the problem statement:
An entertainment company like BookMyShow where users book their tickets have multiple users accessing their web app. Due to less infrastructure availability, they use less machines and provide the required structure. This method includes many weaknesses such as:

Developers must wait till the complete software development for the test results.
There is a huge possibility of bugs in the test results.
Delivery process of the software is slow.
The quality of software is a concern due to continuous feedback referring to things like coding or architectural issues, build failures, test conditions, and file release uploads.
The objective is to implement the automation of the build and release process for
their product.

Implementation requirements:

Set up the Jenkins server in master or slave architecture
Use the Jenkins plugins to perform the computation part on the Docker containers
Create Jenkins pipeline script
Use the GIT web hook to schedule the job on check-in or poll SCM
Build an image using the artifacts and deploy them on containers
Remove the container stack after completing the job
The following tools must be used:

EC2
Jenkins
Docker
Ansible, Chef, or Puppet

## For this sample web app we will be using a react application.
