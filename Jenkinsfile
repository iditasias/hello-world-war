pipeline {
  agent {
    node {
      label 'ubuntu-docker-nodes'
    }

  }
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/iditasias/hello-world-war.git', branch: 'master', changelog: true)
      }
    }

    stage('compile') {
      steps {
        sh 'mvn compile'
      }
    }

  }
}