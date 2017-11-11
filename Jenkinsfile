pipeline{
agent none

 environment {
    MAJOR_VERSION = 1
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
     sh  "sudo docker login -u govind487 -p Govind251@"
	 sh "sudo docker pull govind487/spingrestbootexample"
	 sh "sudo docker run govind487/spingrestbootexample &"
   
   }
  
  }
  
  stage("funtional test ") {
  
  
   agent {
    
     docker 'openjdk:8u151-jre'
   }
   
   steps{
     sh  "echo hello"
	 
	
}
   
   }
   
   
   
   stage('Promote feature  Branch to Master') {
      agent {
        label 'builder'
      }
      when {
        branch 'feature1'
      }
      steps {
        echo "Stashing Any Local Changes"
        sh 'git stash'
        echo "Checking Out feature1 Branch"
        sh 'git checkout feature1'
        echo 'Checking Out Master Branch'
        sh 'git pull origin'
        sh 'git checkout master'
        echo 'Merging feature1 into Master Branch'
        sh 'git merge feature1'
        echo 'Pushing to Origin Master'
        sh 'git push origin master'
        echo 'Tagging the Release'
        sh "git tag springbootrest-${env.MAJOR_VERSION}.${env.BUILD_NUMBER}"
        sh "git push origin springbootrest-${env.MAJOR_VERSION}.${env.BUILD_NUMBER}"
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