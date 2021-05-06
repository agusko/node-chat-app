pipeline {
  agent any
  boolean buildPassed = true;
  stages {
    
    stage('Build') {
      steps {
        script{
            try {        
                sh 'npm install'
            } catch (Exception e) {
                buildPassed = false;
            }        
        }
      }

      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }
      }
    }
    stage('Test') {
      steps{
        script {
            if (buildPassed) {
             sh 'npm test'
            }
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
