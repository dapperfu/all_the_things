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
    stage('BuildCaffe2') {
      steps {
        sh '${WORKSPACE}/build_caffe2.sh'
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
    stage('Build All the Caffe2s') {
      steps {
        sh '${WORKSPACE}/caffe2s.sh'
      }
    }
  }
}
