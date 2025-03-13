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
        stage('Unit test') {
            steps {
                echo 'Starting the testing stage..'
                sh 'cd greetings && go test -v > ./test_report.txt'
                sh 'go test -coverprofile=coverage_test.out'
                sh 'go tool cover -html=coverage_test.out -o /final-year-project/coverage_report.html'
            }
        }
        stage('Store Results as Artifacts') {
            steps {
                archiveArtifacts artifacts: '*_report.*', allowEmptyArchive: true
            }
        }
    }
}
