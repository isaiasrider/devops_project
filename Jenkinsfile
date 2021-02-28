pipeline {
    agent any

    stages {
        stage('Checkout Branch') {
              steps {
                 sh "echo 'checkout feito pelo proprio job'"
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
        stage('Delivery') {
             steps {
               sh "aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 622021885326.dkr.ecr.us-east-2.amazonaws.com"
               sh "docker tag web_app:${GIT_COMMIT} 622021885326.dkr.ecr.us-east-2.amazonaws.com/devops:${GIT_COMMIT}"
               sh "docker push 622021885326.dkr.ecr.us-east-2.amazonaws.com/devops:${GIT_COMMIT}"

                             }
                        }
         stage('Deployment') {
             steps {
              sh "terraform init && terraform get"
//              sh "export TF_VAR_container_version=${GIT_COMMIT}"
//              sh "echo $TF_VAR_container_version"
              sh "terraform plan && terraform apply -var=container_version=${GIT_COMMIT} --auto-approve"

                             }
                        }


    }
}
     always {
             sh "terraform destroy --auto-approve"
     }
