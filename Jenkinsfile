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
        mail(subject: 'Testing node-chat-app - \'${env.JOB_NAME}\'', body: 'readFile("target/surefire-reports/emailable-report.html)', to: 'latowkato@gmail.com')
      }
    }

    stage('Extended post-test') {
      steps {
        emailext(attachLog: true, subject: 'Extended emial', body: 'Job done', to: 'latowkato@gmail.com')
      }
    }

  }
}