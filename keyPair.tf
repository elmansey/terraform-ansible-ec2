# generate public and private key pair 
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# create aws key pair by public key
resource "aws_key_pair" "ansible_tf" {
  key_name   = "ansible_tf"
  public_key = tls_private_key.rsa_key.public_key_openssh
}
# store private key pair into my machine to use it with ssh connect 
resource "local_file" "tf-key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "/home/elmansey/.ssh/ansible_tf.pem"
}