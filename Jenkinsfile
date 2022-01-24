pipeline {
  agent any
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/iditasias/hello-world-war.git', branch: 'dev', changelog: true)
      }
    }

    stage('compile') {
      steps {
        sh 'mvn compile'
      }
    }

    stage('sonarqube') {
      steps {
        sh '''mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=iditasias_hello-world-war -Dsonar.login=55a3b6e2f5ee5c7a1ba18613c086cfd30d1cae0b
'''
      }
    }

    stage('docker build') {
      steps {
        sh '''echo "$USER"
docker build -t helloworld:$BUILD_ID .
'''
      }
    }

    stage('docker tag push') {
      steps {
     
withDockerRegistry(credentialsId: 'nexus', url: 'http://127.0.0.1:8123/repository/docker-hosted/') {
sh '''docker tag helloworld:$BUILD_ID 127.0.0.1:8123/repository/docker-hosted/helloworld:$BUILD_ID

               docker push 127.0.0.1:8123/repository/docker-hosted/helloworld:$BUILD_ID'''
}


      }
    }
post {
     success {
        slackSend(message: "Build deployed successfully - ${env.JOB_NAME} #${env.BUILD_NUMBER} - (${env.BUILD_URL}) ", channel: 'int-project', color: '#008000')
     }

     failure {
          slackSend(message: " Build failed - ${env.JOB_NAME} #${env.BUILD_NUMBER} - (${env.BUILD_URL}) ", channel: 'int-project', color: '#FF0000')
     }
  }
  }
 
}
