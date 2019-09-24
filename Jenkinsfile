def dockerImage
pipeline {
  environment {
    registry = "koushik1995/petclinic"
    registryCredential = 'docker-hub'
  }
  agent any
  tools {
        maven 'Maven 3.3.9'
        jdk 'jdk8'
    }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/Koushikumar/spring-framework-petclinic.git'
      }
    }
stage('packing') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
          dockerImage.push()
          }
        }
      }
    }
    stage("Remove all existing containers"){
        steps{
            sh 'docker ps -a -q |xargs -r docker rm -f'
        }
    }
    stage("Running the new Image"){
        steps{
            sh 'docker run -p 80:9090 -d koushik1995/petclinic:$BUILD_NUMBER'
        }
    }
  }
}
