pipeline {

agent
    agent any


    environment {

        NEW_BUILD_VERSION = '1.2.345'
    }


    tools{
        maven
    }

    stages {

        stage('Fetch code') {
                  steps{
                      git branch: 'develop', url:'https://github.com/chucheka/heroku-demo.git'
                  }
                }


        stage("build") {

            steps {
                sh 'mvn clean package'
                echo 'I am building my Java Application'
            }
        }
        stage("test") {

            steps {
                echo 'Now testing the Java application...'
            }
        }
        stage("deploy") {
            steps {
                echo 'deploying the application...'

                }
            }


    }

    post {

        always {
            // execute logics after execution, build status does not matter.
        }
        success {
            // execute logics after execution, only after a SUCCESSFUL build.
        }
        failure {
            // execute logics after execution, only after a build FAILS.
        }
    }
}