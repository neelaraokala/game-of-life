pipeline {
    agent any
    environment {
        registry = 'copy-your-ecr-repo-here/gameoflife:latest'
    }
    stages {
        stage("Checkout") {
            steps {
                    git branch: 'master',
                        credentialsId: 'github',
                        url: 'https://github.com/neelaraokala/game-of-life.git'
               }
        }
        stage("Docker Build") {
            steps {
                sh "docker build -t gameoflife:latest ."
            }
        }
        stage("ECR Login") {
            steps {
                withAWS(credentials:'aws-credential') {
                    script {
                        def login = ecrLogin()
                        sh "${login}"
                    }
                }
            }
        }
        stage("Docker Push") {
            steps {
                sh "docker push ${registry}"
            }
        }
        stage("Deploy application on EKS") {
            steps {
                sh "kubectl apply -f gameoflife-aws.yml"
            }
        }
    }
    
}
