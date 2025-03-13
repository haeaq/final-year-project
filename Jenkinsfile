pipeline {
    agent { dockerfile true }
    stages {
        stage('Verify OS') {
            steps {
                sh 'whoami'
                sh 'pwd'
            }
        }
        stage('Verify Trivy instellation') {
            steps {
                sh 'trivy'
            }
        }
        stage('Trivy Scan') {
            steps {
                sh 'Starting the scanning stage..'
                sh 'trivy fs .  --scanners vuln,secret,misconfig --output scan_result.json'
            }
        }
        stage('Store Results as Artifacts') {
            steps {
                archiveArtifacts artifacts: 'scan_result.json', allowEmptyArchive: true
            }
        }
    }
}
