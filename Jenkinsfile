pipeline {
    agent { 
        dockerfile {
            args '--name testing-environment-container-2'
        } 
    }
    stages {
        stage('Verify OS') {
            steps {
                sh 'whoami'
            }
        }
        stage('New stage') {
            steps {
                echo 'This is a new stage'
            }
        }  
    } 
}
