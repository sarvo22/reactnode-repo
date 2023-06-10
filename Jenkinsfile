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
                sh "/opt/homebrew/bin/terraform init"
            }
        }
        stage("tf fmt"){
            steps {
                sh "/opt/homebrew/bin/terraform fmt"
            }
        }
        stage("tf validate"){
            steps {
                sh "/opt/homebrew/bin/terraform validate"
            }
        }
        stage("tf plan"){
            steps {
                sh "/opt/homebrew/bin/terraform plan"
            }
        }
        stage("tf apply"){
            steps {
                sh "/opt/homebrew/bin/terraform apply --auto-approve -var docker_img=${env.docker_img}"
            }
        }
    }
}
