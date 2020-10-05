pipeline {
    agent any
    stages {

        stage('Docker Container Creation') {
            steps {

            }
        }

        stage('Clean') {
            steps {

            }
        }

        stage('Build') {
            steps {
                sh '''

                '''
            }
        }

        stage('Unit Test') {
            steps {
                sh '''

                '''
            }
        }

        stage('APK Package && Sign') {
            when {
                branch 'publish'
            }
            steps {
                sh '''

                '''
            }
        }

        stage('Push To Google Play Alpha Channel') {
            when {
                branch 'publish'
            }
            steps {
                sh '''

                '''
            }
        }

        post {
            always {
                
            }
        }
    }
}
