//module "deployment" {
//  source = "github.com/isaiasrider/terraform-modules//modules/services/webserver_cluster?ref=devops-v1.0.0"
//  cluster_name = "web-app-${BUILD_NUMBER}"
//  container_version = "${GIT_COMMIT}"
//  enable_autoscaling = false
//  max_size = 2
//  min_size = 1
//  server_name = ""
//}