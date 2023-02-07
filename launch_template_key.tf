resource "aws_launch_configuration" "ssh_node" {

  key_name = "main_key.pem"

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.allow_ssh.id]
  }
}