pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "raulrfs/repositorio-teste"
        DOCKER_TAG = "traefikImageTeste3"
        DOCKER_REGISTRY = "docker.io"
        K8S_NAMESPACE = "default"
    }

    stages {
        stage("Build Docker Image") {
            steps {
                script {
                    app = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}", "-f ./Dockerfile .")
                }
            }
        }

        stage("Push Docker Image") {
            steps {
                script {
                    sh "echo 'Envio da imagem'"
                    // Adicione aqui o comando para enviar a imagem para o registro Docker
                    // Exemplo: docker.withRegistry("https://${DOCKER_REGISTRY}", 'docker-credentials') {
                    //     app.push("${DOCKER_TAG}")
                    // }
                }
            }
        }

        stage("Deploy no Kubernetes") {
            steps {
                script {
                    sh "echo 'Aplicando configurações no Kubernetes'"
                    // Comentei o trecho com withKubeConfig, mas você pode descomentar e ajustar conforme necessário
                    /*
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh '''
                        kubectl apply -f 00-role.yml \
                                      -f 00-account.yml \
                                      -f 01-role-binding.yml \
                                      -f 02-traefik.yml \
                                      -f 02-traefik-services.yml \
                                      -f 03-whoami.yml \
                                      -f 03-whoami-services.yml \
                                      -f 04-whoami-ingress.yml -n ${K8S_NAMESPACE}
                        '''
                    }
                    */
                    sh '''
                    kubectl apply -f traefik.yml -n ${K8S_NAMESPACE}
                    '''
                }
            }
        }
    }
}
