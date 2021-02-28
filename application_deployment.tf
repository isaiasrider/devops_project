provider "aws" {
  region = "us-east-2"
}
module "deployment" {
  source = "github.com/isaiasrider/terraform-modules//modules/services/webserver_cluster?ref=devops-v1.0.5"
  cluster_name = var.build
  enable_autoscaling = false
  max_size = 2
  min_size = 1
  container_version = var.container_version
  user_data = data.template_file.user-data.rendered
  instance_profile = data.aws_iam_instance_profile.profile.id



}

data template_file "user-data" {
  template = "${file("${path.module}/user-data.sh")}"
  vars = {

    container_version = var.container_version

  }
}

data aws_iam_instance_profile "profile" {
  name = "AdminAccess"
}


