pipeline {
  agent any

  stages {
    boolean buildPassed = true;
    stage('Build') {
      steps {
        try {        
            sh 'npm install'
        } catch (Exception e) {
            buildPassed = false;
        }
      }

      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }
      }
    }
    stage('Test') {
      if (buildPassed) {
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
