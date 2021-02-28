provider "aws" {
  region = "us-east-2"
}
module "deployment" {
  source = "github.com/isaiasrider/terraform-modules//modules/services/webserver_cluster?ref=devops-v1.0.3"
  cluster_name = "web-app-${var.container_version}"
  enable_autoscaling = false
  max_size = 2
  min_size = 1
  container_version = var.container_version

}