pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Build') {
      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }

      }
      steps {
        sh 'npm install'
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
        sh 'smth'
      }
    }

  }
}