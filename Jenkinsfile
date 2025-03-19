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
        stage('Unit test') {
            steps {
                echo 'Starting the testing stage..'
                sh '''
                ls
                cd greetings
                go test -v > test_report.txt
                go test -coverprofile=coverage_test.out
                go tool cover -html=coverage_test.out -o coverage_report.html
                ls
                '''
            }
        }
        stage('Trivy Scan') {
            steps {
                echo 'Starting the scanning stage..'
                sh 'cd ..'
                sh 'trivy fs .  --scanners vuln,secret,misconfig -o trivy_report.txt --no-progress'
                //sh 'trivy fs .  --scanners vuln,secret,misconfig --format template --template "@html.tpl" -o trivy_report.html'
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: '**/*_report.*', allowEmptyArchive: true
        }
    }
}
