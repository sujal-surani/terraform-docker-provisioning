resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.image_id
  name = "terraform-docker-nginx"
  ports {
    internal = 80
    external = 8080
  }
}