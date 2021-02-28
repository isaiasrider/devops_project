pipeline {
    agent any

    stages {
            stage('Checkout Branch') {
                        steps {
                              sh "checkout feito pelo proprio job"
                        }
                    }
        stage('Build') {
             steps {
                sh 'docker build -t web_app:${GIT_COMMIT} ./build'
                sh 'docker images'
                    }
                }
        stage('Test') {
             steps {

                sh "docker run web_app:${GIT_COMMIT} npm test"

                    }
                }
    }
}
