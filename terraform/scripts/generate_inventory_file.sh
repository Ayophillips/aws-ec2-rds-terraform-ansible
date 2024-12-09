#!/bin/bash

# Get Terraform outputs
WEB_IP=$(terraform output -raw web_public_ip)
BACKEND_IP=$(terraform output -raw backend_private_ip)
DB_ENDPOINT=$(terraform output -raw db_endpoint)

# Generate inventory file from template
cat > inventory.ini << EOF
[web]
$WEB_IP

[backend]
$BACKEND_IP

[database]
$DB_ENDPOINT
EOF
