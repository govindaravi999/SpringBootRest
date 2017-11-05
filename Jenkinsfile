pipeline{

agent any

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