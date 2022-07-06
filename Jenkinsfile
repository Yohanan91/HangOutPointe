pipeline {
     agent {
         label 'any'
     }
    environment {
    //once you sign up for Docker hub, use that user_id here
    registry = "yohanan91/hangout"
    //- update your credentials ID after creating credentials for connecting to Docker Hub
    registryCredential = 'dockerhub'
    dockerImage = ''
    }
    stages {

        stage ('checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'a9b284e7-33e1-4f5d-9b55-e28b1a5ff672', url: 'https://github.com/Yohanan91/HangOutPointe']]])
            }
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