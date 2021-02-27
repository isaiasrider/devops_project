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
                sh "pwd"
                sh "cd /var/lib/jenkins/workspace/reactApp/build"
                sh "pwd"
                sh "ls -l"
                sh 'docker build -t web_app:${GIT_COMMIT} ./build'
                sh 'docker images'
                    }
                }
        stage('Test') {
             steps {
                sh "docker run -d --network host web_app:${GIT_COMMIT}"
                sh "curl -X GET http://localhost:3000/"
                sh "docker rm -f \$(docker ps -q)"
                    }
                }
    }
}
