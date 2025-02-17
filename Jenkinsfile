pipeline {
    agent any
tools {
        maven 'Maven'  
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/KidoAklilu/Lab2.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    dir('comp367-webapp') {
                        sh 'mvn clean install'
                    }
                }
            }
        }
    }
}