pipeline {
    agent any

    stages {
            stage('Checkout Branch') {
                        steps {
                            checkout([$class: 'GitSCM', branches: [[name: '${sha1}']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'githubTOKEN', url: 'https://github.com/isaiasrider/devops_project.git']]])

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
        agent {
          docker {
              image 'web_app:${GIT_COMMIT}'
          }
        }
             steps {
               // sh "docker run -d -p0.0.0.0:80:3000 web_app:${GIT_COMMIT}"
                sh "curl -X GET http://localhost/"
            //    sh "docker rm -f \$(docker ps -q)"
                    }
                }
    }
}
