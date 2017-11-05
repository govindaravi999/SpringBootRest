pipeline{

agent {
  label "builder"
 }

stages {

  stage("Build Articat") {
   agent {
      label "builder"
   }
   
   steps{
     sh "mvn clean install"
	 sh "mvn cobertura:cobertura"
	 	
	 //step $class: 'hudson.tasks.junit.JUnitResultArchiver', testResults: 'target/surefire-reports/*.xml'
   
   }
   
   }
     stage("Deploy ") {
   agent {
      label "builder"
   }
   
   steps{
     
	 
	 //sh "java  -jar -Dserver.address=52.87.166.12 -Dserver.port=8585 target/SpringBootRest-0.0.5-SNAPSHOT.jar"
   
   }
  
  }



}
post {

  always{
   archiveArtifacts artifacts: 'target/*.jar', fingerprint:true
   JUnitResultArchiver testResults: 'target/surefire-reports/*.xml'
  }
   success{
    print "success"
   }
  failure{
  
   print "failure"
  }


}



}