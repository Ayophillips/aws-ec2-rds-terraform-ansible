resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    mkdir -p /home/ec2-user/.ssh
    chmod 700 /home/ec2-user/.ssh
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/ocuNm7cV8ehjHt8n/iJOeDK07VN52cNXwm+XD8JlrH+uLM9ixFMyQbIh8X4KYc2LtlCLt3wjMBnJ6LPvEU7ajKnZjv5ZsMIqyRD9y0AjwW4PBwApKgu4iNB6fZkXe4Sn69/O9zFvRJKXV9A4avtjlDnjLrFcWSGSn7/0wFv9z9Di0VbbylcAT+Nmi0rNUzeCfyXwp8v7TSgF232OTin++855o6522LbX1n+dJWRxFsZ6zeYOZ9H9WVuL4atMCmIZ+ZdVIwqiQ6I5R5pt1OumQ2AiwVAMwBD/bfiCowxWReFqnr/6fYqoQ1GxUzX3GHO9k3EVqK5dOQ0+2bz1nYiH" >> /home/ec2-user/.ssh/authorized_keys
    chmod 600 /home/ec2-user/.ssh/authorized_keys
    chown ec2-user:ec2-user /home/ec2-user/.ssh/authorized_keys
  EOF

  root_block_device {
    volume_size = var.volume_size
    volume_type = "gp2"
  }

  tags = {
    Name = var.instance_name
  }
}
