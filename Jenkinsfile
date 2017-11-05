pipeline{

agent any

stages {

  stage("Build Articat") {
   agent {
      label "Builder"
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