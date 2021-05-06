pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }

    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            sh 'npm test'
          }
        }

        stage('Post-test') {
          steps {
            mail(subject: 'Test-mail', body: 'Greetings, Jenkins', to: 'latowkato@gmail.com')
            emailext(subject: 'Test 2 from extended', body: 'Greetings', attachLog: true, to: 'latowkato@gmail.com')
          }
        }

      }
    }

  }
}