pipeline {
    agent { 
        dockerfile {
            args '--name testing-environment-container'
        } 
    }
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
        stage('Verify Go Instellation') {
            steps {
                sh 'go version'
            }
        }
        stage('Trivy Scan') {
            steps {
                echo 'Starting the scanning stage..'
                sh 'cd ..'
                sh 'trivy fs .  --scanners vuln,secret,misconfig --no-progress' // -o trivy_report.txt'
                ///sh 'trivy fs .  --scanners vuln,secret,misconfig --format template --template "@html.tpl" -o trivy_report.html'
            }
        }
     /* stage('New stage') {
            steps {
                echo 'This is a new stage'
            }
        }  */
    } 
    post {
        always {
            archiveArtifacts artifacts: '**/*_report.*', allowEmptyArchive: true
            cleanWs()
        }
    }
}
