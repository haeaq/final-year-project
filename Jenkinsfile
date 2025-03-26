pipeline {
    agent {
        docker { image 'node:22.14.0-alpine3.21' }
    }
    stages {
        stage('Verify OS') {
            steps {
                sh 'whoami'
            }
        }
        stage('New stage') {
            steps {
                echo 'This is a new stage, run in node alpine image '
            }
        }  
        stage('Print Local Directory') {
            steps {
                sh 'pwd'
            }
        }
    } 
}
