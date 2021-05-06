pipeline {
  agent {
    docker {
      image 'ubuntu:latest'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'sudo apt install npm'
        sh 'npm install'
      }
    }

  }
}