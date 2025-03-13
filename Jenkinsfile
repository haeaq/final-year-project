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
            agent {
                docker { image 'aquasec/trivy' }
            }
            steps {
                echo 'Starting the scanning stage..'
                sh 'trivy fs .  --scanners vuln,secret,misconfig --format template --template "@/usr/local/share/trivy/templates/html.tpl" -o report.html'
            }
        }
        stage('Store Results as Artifacts') {
            steps {
                archiveArtifacts artifacts: 'report.html', allowEmptyArchive: true
            }
        }
    }
}
