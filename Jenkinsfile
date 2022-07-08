pipeline {
     agent any
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
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '5c807e9f-3fd5-4529-90f0-9013a298409d', url: 'https://github.com/Yohanan91/HangOutPointe']]])
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

        stage('Docker Run') {
            steps{
                script {
                    dockerImage.Run()
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