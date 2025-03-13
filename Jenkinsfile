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
                    sh 'docker build -t kd122/my-maven-app:latest -f comp367-webapp/Dockerfile .'
                }
            }
        }
        stage('Docker Login') {
            steps {
                withDockerRegistry([credentialsId: 'docker-credentials', url: '']) {  
                    sh 'echo $DOCKER_PASSWORD | docker login -u kd122 --password-stdin'
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
