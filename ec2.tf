resource "aws_instance" "ansible_nexus" {
  ami           = data.aws_ami.ubuntu.id
  availability_zone = var.AVAILABILITY_ZONE
  instance_type = var.INSTANCE_TYPE
  vpc_security_group_ids = [aws_security_group.allow_ssh_and_port_8081.id]
  subnet_id = aws_subnet.public_subnet_1.id
  key_name = aws_key_pair.ansible_tf.id
  user_data = <<-EOF
              #!/bin/bash
                sudo apt update -y
                sudo useradd -ms /bin/bash ansible
                sudo usermod -aG sudo ansible
                sudo echo "ansible:123456" | chpasswd
                sudo mkdir /home/ansible/.ssh/
                sudo touch /home/ansible/.ssh/authorized_keys
                echo '${tls_private_key.rsa_key.public_key_openssh}' >> /home/ansible/.ssh/authorized_keys
             EOF
  tags = {
    Name = "ansible_nexus"
  }
}