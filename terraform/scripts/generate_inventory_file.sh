#!/bin/bash

# Get Terraform outputs
 INSTANCES=$(cat tf_outputs.json | jq -r '.instances.value')

WEB_IP=$(echo $INSTANCES | jq -r '.web')
BACKEND_IP=$(echo $INSTANCES | jq -r '.backend')
BASTION_IP=$(echo $INSTANCES | jq -r '.bastion')
DB_ENDPOINT=$(echo $INSTANCES | jq -r '.database')

# Generate inventory file from template
cat > inventory.ini << EOF
[web]
$WEB_IP

[backend]
$BACKEND_IP

[bastion]
$BASTION_IP

[database]
$DB_ENDPOINT
EOF

cat ../ansible/inventory.ini