pipeline {
        agent any
        stages {
          stage("SonarQube analysis") {
           
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
          

           

        stage("Building docker images") {
            steps {

              sh '''
              ls 
              pwd
              rm -rf webapp.war
              cp -r  webapp/target/webapp.war .'
              sudo docker build -t linux2021/tomcat:${BUILD_NUMBER} . 
              '''
            }
          }
            
          
        stage("Pushing images") { 
            steps {
              sh '''
              sudo docker login -u linux2021 -p Police1998
              sudo docker push linux2021/tomcat:${BUILD_NUMBER}
              '''
            }
          }


        }


      }
