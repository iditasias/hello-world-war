pipeline {
  agent {
    node {
      label 'ubuntu-docker-nodes'
    }

  }
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

  }
}