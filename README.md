# Terraform Docker Provisioning

This project demonstrates Infrastructure as Code (IaC) principles by provisioning and managing a local Docker container using Terraform. 

## Project Overview
The goal of this task was to use Terraform to automatically download a Docker image and spin up a container locally without manually running Docker CLI commands. This showcases the power of declarative infrastructure management.

## Project Structure
Instead of a single `main.tf`, the configuration is modularized:
* **`providers.tf`**: Configures the required `kreuzwerker/docker` provider (version `4.6.0` as resolved during initialization).
* **`docker-cont.tf`**: Contains the resource definitions to pull the `nginx:latest` image and run it as a container (`terraform-docker-nginx`) mapping internal port 80 to external port 8080.
* **`execution_logs.txt`**: A captured log of the terminal commands and Terraform's output during the infrastructure lifecycle.

## Execution Workflow
The following steps were executed to manage the infrastructure:

1. **Initialization:** 
   Ran `terraform init` to initialize the backend and download the necessary Docker provider plugins.
2. **Planning & Debugging:** 
   Ran `terraform plan` to preview changes. Resolved initial syntax deprecations (updating `.latest` to `.image_id` and `port` to `ports`) to ensure a clean execution plan.
3. **Provisioning:** 
   Ran `terraform apply` to create the resources. Terraform successfully pulled the Nginx image and spun up the container in under 25 seconds.
4. **Verification:** 
   * `terraform state list` confirmed Terraform was tracking `docker_container.nginx_container` and `docker_image.nginx`.
   * `docker ps` and `docker images` were used to manually verify the Nginx container was actively running and the image was stored locally.
5. **Teardown:** 
   Ran `terraform destroy` to tear down the container and remove the image, returning the local environment to its original state cleanly.

## Key Learnings
* **IaC (Infrastructure as Code):** Managing infrastructure through machine-readable configuration files.
* **Terraform State:** Understanding how Terraform uses the `.tfstate` file to map real-world resources to the configuration.
* **Providers:** Utilizing the Docker provider plugin to allow Terraform to interact with the local Docker daemon API.