provider "aws" {
  region = "us-east-2"
}
module "deployment" {
  source = "github.com/isaiasrider/terraform-modules//modules/services/webserver_cluster?ref=devops-v1.0.4"
  cluster_name = var.build
  enable_autoscaling = false
  max_size = 2
  min_size = 1
  container_version = var.container_version
  user_data = <<EOF
#!/bin/bash
container_version=${container_version}
yum update -y
yum install docker
docker run -d -p80:3000 622021885326.dkr.ecr.us-east-2.amazonaws.com/devops:${container_version}

EOF


}