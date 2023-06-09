pipeline {
    agent any
    stages {
        stage("Clone") {
            steps {
                git branch: "master", url: "https://github.com/sarvo22/reactnode-repo.git"
            }
        }
        stage("Build"){
            steps {
                sh "/usr/local/bin/docker build -t nodeimg:s1 ."
            }
        }
        stage("LogIn"){
            steps {
                sh "/usr/local/bin/docker login --username=sarvo22 --password=Rajasarvo"
            }
        }
        stage("Tag"){
            steps {
                sh "/usr/local/bin/docker tag nodeimg:s1 sarvo22/nodeimg:s1"
            }
        }
        stage("Push"){
            steps {
                sh " /usr/local/bin/docker push sarvo22/nodeimg:s1"
            }
        }
        stage("Run"){
            steps {
                sh "/usr/local/bin/docker run -itd --name reactnodecont -p 3080:3080 sarvo22/nodeimg:s1"
            }
        }
    }
}