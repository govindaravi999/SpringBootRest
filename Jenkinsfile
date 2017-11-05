pipeline{

agent any

stages {

  stage {
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