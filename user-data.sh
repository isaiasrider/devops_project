#!/bin/bash

container_version=${container_version}
yum update -y
yum install docker -y
dockerd &
ls -l /var/run/
chmod 777 /var/run/docker.sock
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 622021885326.dkr.ecr.us-east-2.amazonaws.com
docker run -d -p80:3000 622021885326.dkr.ecr.us-east-2.amazonaws.com/devops:${container_version}
