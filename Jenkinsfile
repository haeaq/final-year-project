pipeline {
    agent { dockerfile true }
    stages {
        stage('Verify') {
            steps {
                sh 'whoami'
            }
        }
        stage('Trivy') {
            steps {
                sh 'trivy'
            }
        }
    }
}
