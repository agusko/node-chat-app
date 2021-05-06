pipeline {
  agent any

  stages {

    stage('Build') {
      steps {
        def buildresult = sh 'npm install'
        if (buildresult == 'Failed') {
          error "Build failed"        
        }
      }

      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }
      }
    }
    stage('Test') {
      when {
        smth
      }
      steps {
        sh 'npm test'
      }
      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }
      }
    }
  }
}
