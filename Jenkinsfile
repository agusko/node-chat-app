pipeline {
  agent none
  
  stages {
    stage('Build') {
      agent any
      post {
        always {
          emailext(attachLog: true, subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}", body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}", to: 'latowkato@gmail.com')
        }

      }
      steps {
        sh 'npm install'
        sh 'ls node_modules'
        stash(includes: 'node_modules/', name: 'artifact1')
        stash(includes: 'package-lock.json', name: 'artifact2')
      }
    }

    stage('Test') {
      agent any
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
      agent {
        dockerfile {
            filename 'Dockerfile'
        }
      }
      steps {
        echo 'Deploying..'
        unstash 'artifact1'
        unstash 'artifact2'
      }
    }

  }
}
