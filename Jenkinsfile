pipeline {
    agent any
    environment {
        docker_img = "nodeimg:$BUILD_NUMBER"
    }
    parameters {
        string description: 'Enter the username', name: 'Username'
        password defaultValue: '', description: 'Enter the password', name: 'Password'
    }
    stages {
        stage("Git clone") {
            steps {
                git branch: "master", url: "https://github.com/sarvo22/reactnode-repo.git"
            }
        }
        stage("tf init"){
            steps {
                sh "terraform init"
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
                sh "terraform apply"
            }
        }
    }
}
