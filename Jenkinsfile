pipeline {
  agent {
    docker {
      image 'ubuntu:latest'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'apt install npm'
        sh 'npm install'
      }
    }

  }
}