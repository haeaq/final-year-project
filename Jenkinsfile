pipeline {
    agent {
        docker { image 'node:lts-jod' }
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
