pipeline {
  agent none
  tools{
      nodejs "node"
  }
  
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
        stash(includes: 'node_modules/*', name: 'artifact1')
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
        sh 'npm install --global mocha'
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
<<<<<<< HEAD
        sh 'docker build -t node-chat-app:latest .'
        ustash 'artifact1'
        ustash 'artifact2'
=======
        echo 'Deploying..'
        unstash 'artifact1'
        unstash 'artifact2'
>>>>>>> 28967580cf22302e00e5fea02098bd691dd62e83
      }
    }

  }
}
