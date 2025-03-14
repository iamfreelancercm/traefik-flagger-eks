
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "jenkins-ssh-key" # Create "myKey" to AWS!!
  public_key = tls_private_key.rsa.public_key_openssh
}

output "ssh_private" {
  value     = tls_private_key.rsa.private_key_pem
  sensitive = true
}
