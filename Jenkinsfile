pipeline {
  agent {
    docker {
      image 'node:15.14.0-stretch'
      args '-p 3000:3000'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }

  }
}