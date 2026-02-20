#!/bin/bash

# Variables
  KEY_PATH=~/.ssh/MarkRS_cloud_deployment.pem
  EC2_HOST=ec2-user@3.8.20.210
  REMOTE_DIR=/home/ec2-user/message-server
  PASSWORD=LetMeIn123.

# Copy necessary files
echo "> Uploading files to EC2"
scp -i $KEY_PATH app.py requirements.txt Dockerfile $EC2_HOST:$REMOTE_DIR

# Connect and run container
ssh -i $KEY_PATH $EC2_HOST << EOF
  cd message-server
  docker build -t message-server-image .
  docker stop message-server || true
  docker rm message-server || true
  docker run -d -p 5002:5002 --name message-server \
    -e APP_ENV=PRODUCTION \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=$PASSWORD \
    -e POSTGRES_HOST=markrs-message-server-db.cvruukypsgyb.eu-west-2.rds.amazonaws.com \
    -e POSTGRES_DB=postgres \
    message-server-image
EOF

echo "✅ Deployment complete! Visit: http://3.8.20.210:5002"
