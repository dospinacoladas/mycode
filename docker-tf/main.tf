# main.tf

# terraform block
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

# provider block
provider "docker" {}

# resource block - docker image
resource "docker_image" "nginx" {
  name         = "nginx:1.19.6"
  keep_locally = true    // keep image after "destroy"
}

# resource block - docker container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  network_mode = "bridge"
  ports {
    internal = 80
    external = 2224
  }
}

