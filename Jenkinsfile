pipeline {
  agent none
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
        sh '''mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=iditasias_hello-world-war -Dsonar.login=$sonar_cerd
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
        sh '''docker tag helloworld:$BUILD_ID 10.100.102.45:8123/repository/docker-hosted/helloworld:$BUILD_ID
docker push 10.100.102.45:8123/repository/docker-hosted/helloworld:$BUILD_ID
'''
      }
    }

  }
  environment {
    sonar_cerd = credentials('SONAR_TOKEN')
  }
}