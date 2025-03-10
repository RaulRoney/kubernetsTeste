pipeline {
     agent any

    environment {
    DOCKER_IMAGE = "raulrfs/repositorio-teste"
        DOCKER_TAG = "traefikImageTeste3"
        DOCKER_REGISTRY = "docker.io"
        K8S_NAMESPACE =  "default"

    }
    stages {
        stage("build Docker image") {
            steps {
                script {
                     app = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}", "-f ./Dockerfile.")
                }
            }
        }
        stage("push Docker Image") {
            steps {
                sh "echo 'envio da imagem'"
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub'){
                        app.push("${DOCKER_TAG}")
                     }                   
                }
            }
        }
        stage("Deploy no kubernetes") {
            steps {
                sh "echo 'envio da imagem'"
                /*withKubeConfig([credentialsId: 'kubeconfig']) {
                    sh 'kubectl apply -f 00-role.yml \
              -f 00-account.yml \
              -f 01-role-binding.yml \
              -f 02-traefik.yml \
              -f 02-traefik-services.yml \
              -f 03-whoami.yml \
              -f 03-whoami-services.yml \
              -f 04-whoami-ingress.yml '  
            }*/
                script {
                    sh '''
                    kubectl apply -f traefik.yml -n ${K8S_NAMESPACE}
                    '''
                }
            }
        }
    }
}




    
