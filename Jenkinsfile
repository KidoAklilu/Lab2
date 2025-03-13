pipeline {
    agent any
    tools {
        maven 'Maven'  
    }
    environment {
        DOCKER_IMAGE = 'kd122/maven-java-webapp'
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
            sh 'docker build -t kd122/my-maven-app:latest .'
        }
    }
        }
        stage('Push to Docker Hub') {
            steps {
        script {
            sh 'docker push kd122/my-maven-app:latest'
        }
    }
    }
}
