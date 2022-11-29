pipeline
{
    agent any
    stages{
        stage('CleanUP Stage')
        {
            steps{
                //define the sigle or multiple step
                bat 'echo CleanUp'
                cleanWs notFailBuild: true
            }
            
        }
        stage('GitCheckout Stage')
        {
             steps{
                //define the sigle or multiple step
                bat 'echo GitCheckout'
               checkout([$class: 'GitSCM', branches: [[name: '**']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Dikshabhutada/KarateAPIFramework.git']]])
            }
        }
        stage('Restore Package Stage')
        {
             steps{
                //define the sigle or multiple step
                bat 'echo Restore Package'
            }
            
        }
        stage('Build Stage')
        {
             steps{
                //define the sigle or multiple step
                bat 'echo Build'
                bat 'mvn clean compile'
            }
            
        }
        stage('Run the test')
        {
             steps{
                //define the sigle or multiple step
                bat 'echo Test Execution Started'
                bat 'mvn test'
            }
            
        }
    }
    
    post {
  always {
    // One or more steps need to be included within each condition's block.
    junit 'target/surefire-reports/*.xml' 
    cucumber buildStatus: 'null', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/surefire-reports', pendingStepsNumber: -1, reportTitle: 'Karate test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
  }
}

}