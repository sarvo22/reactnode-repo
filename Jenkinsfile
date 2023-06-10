pipeline {
    agent any
    environment {
        docker_img = "nodeimg:$BUILD_NUMBER"
    }
    stages {
        stage("Git clone") {
            steps {
                git branch: "master", url: "https://github.com/sarvo22/reactnode-repo.git"
            }
        }
        stage("tf init"){
            steps {
                sh "/Users/sarvo/Desktop/react-app/ terraform init"
            }
        }
        stage("tf fmt"){
            steps {
                sh "terraform fmt"
            }
        }
        stage("tf validate"){
            steps {
                sh "terraform validate"
            }
        }
        stage("tf plan"){
            steps {
                sh "terraform plan"
            }
        }
        stage("tf apply"){
            steps {
                sh "terraform apply --auto-approve -var docker_img=${env.docker_img}"
            }
        }
    }
}
