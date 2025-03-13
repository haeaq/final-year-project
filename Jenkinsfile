pipeline {
    //agent { dockerfile true }
    agent {
        docker { image 'aquasec/trivy' }
    }
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
