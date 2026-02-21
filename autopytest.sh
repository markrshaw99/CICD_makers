#!/bin/bash

# Variables
  KEY_PATH=~/.ssh/MarkRS_cloud_deployment.pem
  EC2_HOST=ec2-user@3.8.20.210
  REMOTE_DIR=/home/ec2-user/message-server
  PASSWORD=LetMeIn123.

# Copy necessary files
echo "Pytest Time"

# Connect and run tests on EC2
ssh -i "$KEY_PATH" "$EC2_HOST" << 'EOF'
    source .venv/bin/activate
    cd message-server
    export APP_ENV=PRODUCTION
    export POSTGRES_USER=postgres
    export POSTGRES_PASSWORD=LetMeIn123.
    export POSTGRES_HOST=markrs-message-server-db.cvruukypsgyb.eu-west-2.rds.amazonaws.com
    export POSTGRES_DB=postgres
    pytest
EOF