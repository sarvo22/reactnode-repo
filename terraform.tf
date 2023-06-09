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
  name = "nodeimg:s1"
}

resource "docker_container" "reactnodecont" {
  image = docker_image.node.name
  name  = "reactnodecont"
  port {
    internal = 3080
    external = 3080
  }
  restart = "always"
}
