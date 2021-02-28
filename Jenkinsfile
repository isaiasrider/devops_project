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
