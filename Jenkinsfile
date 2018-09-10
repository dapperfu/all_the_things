pipeline {
  agent any
  stages {
    stage('AllPython') {
      steps {
        sh '${WORKSPACE}/all_py.sh'
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts(artifacts: 'opt/*', onlyIfSuccessful: true, fingerprint: true)
      }
    }
  }
}