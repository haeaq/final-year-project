pipeline {
    agent { dockerfile true }
    stages {
        stage('Verify OS') {
            steps {
                sh 'whoami'
            }
        }
        stage('Print Local Directory') {
            steps {
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
                sh 'trivy fs .  --scanners vuln,secret,misconfig --format template --template "@html.tpl" -o trivy_report.html'
            }
        }
        stage('Store Results as Artifacts') {
            steps {
                archiveArtifacts artifacts: 'trivy_report.html', allowEmptyArchive: true
            }
        }
    }
}
