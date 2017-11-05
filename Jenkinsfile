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
	 	
    step([$class: 'ArtifactArchiver', artifacts: '**/*.jar', fingerprint: true])	
    step $class: 'hudson.tasks.junit.JUnitResultArchiver', testResults: 'target/surefire-reports/*.xml'
   
   }
   
   }
     stage("Deploy ") {
   agent {
      label "builder"
   }
   
   steps{
     
	 sh "ls -ltr"
	 //sh "java  -jar -Dserver.address=52.87.166.12 -Dserver.port=8585 target/SpringBootRest-0.0.5-SNAPSHOT.jar"
   
   }
  
  }



}
post {

  always{
 
  print "in always"
   
  }
   success{
    print "success"
   }
  failure{
  
   print "failure"
  }


}



}