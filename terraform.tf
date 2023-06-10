terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "node" {
  name = var.docker_img
  build {
    context = "."
    dockerfile = "Dockerfile"
  }
}
variable "docker_img" {
  type        = string
  description = "name of the docker image to deploy"
  #default     = "sarnode:$BUILD_NUMBER"
}
resource "docker_container" "sar-nodecont1" {
  image = docker_image.node.name
  name  = "sar-nodecont1-{env.$BUILD_NUMBER}"
  ports {
    internal = 3080
    external = 3040
  }
  restart = "always"
}
