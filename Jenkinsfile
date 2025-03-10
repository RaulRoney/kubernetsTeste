pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "raulrfs/repositorio-teste"
        DOCKER_TAG = "traefikImageTeste3"
        DOCKER_REGISTRY = "https://registry.hub.docker.com"
        K8S_NAMESPACE = "default"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", 'dockerhub') {
                        docker.image('docker:latest').inside {
                            sh """
                                docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} -f ./Dockerfile .
                            """
                        }
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", 'dockerhub') {
                        sh """
                            docker push ${DOCKER_IMAGE}:${DOCKER_TAG}
                        """
                    }
                }
            }
        }

        stage('Deploy no Kubernetes') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh """
                            kubectl apply -f traefik.yml -n ${K8S_NAMESPACE}
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executada com sucesso!'
        }
        failure {
            echo 'Pipeline falhou. Verifique os logs para mais detalhes.'
        }
    }
}
