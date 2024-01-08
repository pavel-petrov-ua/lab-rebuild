provider "aws" {
  region = "us-east-1"  # Замініть на свою регіон AWS
}

terraform {
  backend "s3" {
    bucket         = "petrov-pavlo-2023-11-20"
    key            = "aws/main/build_temp_instance/terraform.tfstate"
    region         = "us-east-1"  
    encrypt        = true
  }
}

data "terraform_remote_state" "main_line" {
  backend = "s3"
  config = {
    bucket = "petrov-pavlo-2023-11-20"
    key    = "aws/main/terraform.tfstate"
    region = "us-east-1"
  }
}

#data "github_actions_secret" "ring-ring"
#  name = ""

resource "aws_instance" "ami_ring_ring" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.main_line.outputs.subnet_ids[1]
  key_name      = "ec2_github"
  vpc_security_group_ids = [data.terraform_remote_state.main_line.outputs.security_group_id]
  associate_public_ip_address = true
 
  tags = {
    Name = "example-instance"
  }

  # provisioner "local-exec" {
  #    command = "cat ~/.ssh/id_rsa236.pem"
  # }

  provisioner "remote-exec" {
  inline = ["echo 'Wait until SSH is ready' >> ~/test.txts"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
 #     private_key = base64decode(env.ssh-private-key)
 #     private_key = file("~/.ssh/id_rsa236.pem")
 #     private_key = data.github_actions_secret.private_key.name
      private_key = var.ssh_private_key
      host        = aws_instance.ami_ring_ring.public_ip
     }
   }

  # provisioner "local-exec" {
  #   command = "ANSIBLE_PRIVATE_KEY=${var.ssh_private_key} ansible-playbook  -i ${aws_instance.ami_ring_ring.public_ip} docker_install.yaml"
  # }
}









