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
                sh 'trivy fs .  --scanners vuln,secret,misconfig --no-progress' // -o trivy_report.txt'
                ///sh 'trivy fs .  --scanners vuln,secret,misconfig --format template --template "@html.tpl" -o trivy_report.html'
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
