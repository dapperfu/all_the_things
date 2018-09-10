pipeline {
  agent any
  stages {
    stage('BuildPython') {
      steps {
        sh '${WORKSPACE}/build_python.sh'
      }
    }
    stage('BuildDarknet') {
      steps {
        sh '${WORKSPACE}/build_darknet.sh'
      }
    }
    stage('Build All the Pythons') {
      steps {
        sh '${WORKSPACE}/pythons.sh'
      }
    }
    stage('Build All the Darknets') {
      steps {
        sh '${WORKSPACE}/darknets.sh'
      }
    }
  }
}
