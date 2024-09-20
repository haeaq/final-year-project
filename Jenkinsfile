pipeline {
  agent {
    docker {
      image 'bitnami/python:3.8.20-debian-12-r4'
    }

  }
  stages {
    stage('start') {
      steps {
        echo 'starting the pipeline'
      }
    }

    stage('test') {
      steps {
        sh 'python3 --version'
      }
    }

  }
}