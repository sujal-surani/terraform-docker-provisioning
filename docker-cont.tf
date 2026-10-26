resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.latest
  name = "terraform-docker-nginx"
  port {
    internal = 80
    external = 8080
  }
}