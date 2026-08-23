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
                    buildDockerImageEcr()
                    dockerLoginEcr()
                    dockerPushEcr()
                }
            }
        }
         stage("deploy") {
             steps {
                 script {
                     deployToEcrEc2()
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
