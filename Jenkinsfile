pipeline{

agent any

stages {

  stage("Build Articat") {
   agent {
      label "builder"
   }
   
   steps{
     sh "mvn clean install"
   }
  
  }



}
post {

  always{
  deleteDir()
  }
   success{
    print "success"
   }
  failure{
  
   print "failure"
  }


}



}