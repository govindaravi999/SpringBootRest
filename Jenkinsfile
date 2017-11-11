pipeline{

agent none

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
     
	 sh "docker run hello-world"
   
   }
  
  }
  
  stage("functionaltest ") {
   agent {
      docker 'openjdk:8u121-jre'
   }
   
   steps{
     
	 sh "docker run hello-world"
   
   }
  
  }



}
post {

  always{
 
  print "in always"
   
  }
   success{
    print "success"
	
	  emailext attachLog: true, body: "Check console output at ${env.BUILD_URL} to view the results.<br>", mimeType: 'text/html', subject: "${env.JOB_NAME} - Build # ${env.BUILD_NUMBER} - Failure", to: 'govind487@gmail.com'
   }
  failure{
  
   print "failure"
  }


}



}