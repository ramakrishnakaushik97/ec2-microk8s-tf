
# INSTANCE 1#
resource "aws_instance" "mediawiki_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.medium" #  microk8s or minikubs require atleast 2 CPUs
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.mediawiki_instance_sg.id]
  key_name               = "mediawiki_aws_key"

  tags = local.common_tags
}


resource "null_resource" "copy_execute" {

  connection {
    type        = "ssh"
    host        = aws_instance.mediawiki_instance.public_ip
    user        = "ubuntu"
    private_key = file("mediawiki_aws_key.pem")
    timeout     = "1m"
  }

  provisioner "file" {
    source      = "${path.module}/scripts/install_microk8s.sh"
    destination = "/tmp/install_microk8s.sh"
  }

  provisioner "file" {
    source      = "${path.module}/scripts/install_mediawiki.sh"
    destination = "/tmp/install_mediawiki.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/install_microk8s.sh",
      "sudo chmod 777 /tmp/install_mediawiki.sh",
      "sh /tmp/install_microk8s.sh",
      "sh /tmp/install_mediawiki.sh"
    ]
  }

  depends_on = [aws_instance.mediawiki_instance]

}
