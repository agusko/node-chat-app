pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'
      }
    }

    stage('Post-test') {
      steps {
        mail(subject: 'Testing node-chat-app - \'${env.JOB_NAME}\'', body: 'readFile("target/surefire-reports/emailable-report.html)')
      }
    }

  }
}