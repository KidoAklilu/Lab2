pipeline {
    agent any
    triggers {
        pollSCM('H/5 * * * *')  // Poll SCM every 5 minutes
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/KidoAklilu/Lab2.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'mvn clean install'
                }
            }
        }
    }
}
