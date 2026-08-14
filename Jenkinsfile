@Library('jenkins-shared-library') _

pipeline {
    agent any

    tools {
        nodejs 'node'
    }

    stages {
        stage("increment version") {
           steps {
              script {
                  sh "which node"
                  sh "node --version"
                  sh "which npm"
                  sh "npm --version"
                  incrementVersionExercise()
             }
          }
        }

         stage("run app tests") {
               steps {
                   script {
                       appTestRun()
                  }
               }
         }

        stage("build and push docker image") {
            steps {
                script {
                    buildDockerImageExercise()
                    dockerLoginExercise()
                    dockerPushExercise()
                }
            }
        }

        stage("commit version") {
            steps {
                script {
                    commitVersionExercise()
               }
            }
        }
    }
}