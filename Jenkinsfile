pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                echo "O checkout já é feito pelo plugin github contido na configuração do pipeline. Porém, SIM, pode ser scriptada"
            }
        }
        stage('Build') {
             steps {
                sh 'docker ps && docker images'
                    }
                }
        stage('Test') {
             steps {
                echo "fake test"
                    }
                }
    }
}
