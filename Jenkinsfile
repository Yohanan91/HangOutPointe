pipeline {
     agent {
         label 'worker_node'
     }
        environment {
        //once you sign up for Docker hub, use that user_id here
        registry = "yohanan91/myreact_project"
        //- update your credentials ID after creating credentials for connecting to Docker Hub
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages {

        stage ('checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '4341afa9-5578-469a-9987-44aa32938d8b', url: 'https://github.com/Yohanan91/makeitwork']]])}
        }
    
        stage ('Build docker image') {
            steps {
                script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
          // Uploading Docker images into Docker Hub
        stage('Upload Image') {
            steps{   
                script {
                docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }
    
        stage ('K8S Deploy') {
        steps {
            script {
                kubernetesDeploy(
                    configs: 'deployment.yaml',
                    kubeconfigId: 'K8S',
                    enableConfigSubstitution: true
                    )           
               
                }
            }
        }
    }
}