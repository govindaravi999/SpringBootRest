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
     sh "mvn clean install -DskipTests=true"
	 sh "mvn cobertura:cobertura"
	 sh "docker build -t govind487/spingrestbootexample ."
	 sh "docker login -u govind487 -p Govind251@"
     sh "docker push govind487/spingrestbootexample"
	
    step([$class: 'ArtifactArchiver', artifacts: '**/*.jar', fingerprint: true])	
    step $class: 'hudson.tasks.junit.JUnitResultArchiver', testResults: 'target/surefire-reports/*.xml'
   
   }
   
   }
     stage("Deploy ") {
   agent {
      label "deploy"
   }
   
   steps{
     sh  "docker login -u govind487 -p Govind251@"
	 sh "docker pull govind487/spingrestbootexample"
	 sh "docker run -i -t govind487/spingrestbootexample"
   
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