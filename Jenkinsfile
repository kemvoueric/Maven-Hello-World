pipeline {
        agent none
        stages {
          stage("SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('sonarqube') {
                sh 'mvn clean  sonar:sonar'
              }
            }
          }


          stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
          
          stage("Maven build") {
            steps {
              sh 'mvn clean install package'
            }
          }
          
        // stage("Building docker images") {
        //     steps {
        //       sh 'docker build -t tomcat:focus .'
        //     }
        //   }

        }


      }
