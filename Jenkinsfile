pipeline {
    agent any
    tools {
        maven 'Maven'  
    }
    environment {
        DOCKER_IMAGE = 'kd122/my-maven-app:latest'  
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/KidoAklilu/Lab2.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    dir('comp367-webapp') {  
                        sh 'mvn clean package'
                    }
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-credentials', url: 'https://index.docker.io/v1/']) {
                        echo "Docker login successful"
                    }
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }
}
