pipeline {
    agent any
    
    tools {
        maven 'maven' // Ensure 'maven' matches the Maven installation name in Jenkins
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code"
                git branch: 'develop', url: 'https://github.com/chucheka/heroku-demo.git'
                echo "Current working directory: ${pwd()}"
            }
        }
        
        stage('Build and Test') {
            steps {
                echo "Building and testing"
                sh 'mvn clean package' // Verify Maven is available and configured correctly
                sh 'ls -l target'
            }
        }
        
        stage('Code Analysis') {
            steps {
                script {
                    withSonarQubeEnv('sonarsql') {
                        echo "Running SonarQube analysis"
                        sh 'mvn install sonar:sonar' // Ensure SonarQube analysis is properly configured
                    }
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image"
                    dir('/var/lib/jenkins/workspace/heroku-demo') {
                      sh 'docker build -t ujusophy/heroku-demo .'
                    }
                }
            }
        }
        
        stage('Push Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'ujusophydocker', variable: 'dockerhubpwd')]) {
                        echo "Logging into Docker Hub"
                        sh "docker login -u ujusophy -p ${dockerhubpwd}"
                        
                        echo "Tagging and pushing Docker image"
                        sh "docker push ujusophy/heroku-demo"
                    }
                }
            }
        }
    }
}
