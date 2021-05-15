pipeline {
  agent any
  stages {
    stage('Build') {
      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }

      }
      steps {
        sh 'npm install'
        sh 'ls node_modules'
        stash includes: 'node_modules/', name: 'artifact1'
        stash includes: 'package-lock.json', name: 'artifact2'     
      }
    }

    stage('Test') {
      when {
        expression {
          currentBuild.result != 'UNSTABLE'
        }

      }
      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Test ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} tested ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }

      }
      steps {
        sh 'npm test'
      }
    }

    stage('Deploy') {
      steps {
        sh 'docker build -t node-chat-app:latest .'
        ustash 'artifact1'
        ustash 'artifact2'
      }
    }

  }
}
