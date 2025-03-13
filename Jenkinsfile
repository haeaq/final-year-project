pipeline {
    agent { dockerfile true }
    stages {
        stage('Verify OS') {
            steps {
                sh 'whoami'
                sh 'pwd'
            }
        }
        stage('Verify Trivy Instellation') {
            steps {
                sh 'trivy --version'
            }
        }
        stage('Trivy Scan') {
            steps {
                echo 'Starting the scanning stage..'
                sh 'trivy fs .  --scanners vuln,secret,misconfig --format table --output scan_result.txt'
            }
        }
        stage('Store Results as Artifacts') {
            steps {
                archiveArtifacts artifacts: 'scan_result.txt', allowEmptyArchive: true
            }
        }
    }
}
