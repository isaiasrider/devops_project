#!/bin/bash

container_version=${container_version}
yum update -y
yum install docker
docker run -d -p80:3000 622021885326.dkr.ecr.us-east-2.amazonaws.com/devops:${container_version}