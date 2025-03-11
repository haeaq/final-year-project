pipeline {
    agent { dockerfile true }
    stages {
        stage('Verify OS') {
            steps {
                sh 'whoami'
            }
        }
        stage('Verify Trivy instellation') {
            steps {
                sh 'trivy'
            }
        }
        stage('Trivy Scan') {
            steps {
                sh 'trivy fs . --format json --output scan_result.json'
            }
        }
    }
}
