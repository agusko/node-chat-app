pipeline {
  agent any
  stages {
    
    stage('Build') {
      steps {       
        sh 'npm install'
      }

      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }
      }
    }

    stage('Test') {
      when {
        expression {
          currentBuild.result == 'SUCCESS'
        }
      steps{
        sh 'npm test'
        }
      }
      
      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }
      }
    }
  }
}
