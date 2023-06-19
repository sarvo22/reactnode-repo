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
  name = "boom:${var.docker_img}"
  build {
    context = "."
    dockerfile = "Dockerfile"
  }
}
variable "docker_img" {
  type        = string
  description = "name of the docker image to deploy"
}
resource "docker_container" "boom_cont" {
  image = docker_image.node.name
  name  = "boom_cont-${var.docker_img}"
  ports {
    internal = 3080
    external = 3060
  }
  restart = "always"
}
