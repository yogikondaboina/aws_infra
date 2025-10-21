# Get existing VPC
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["host-vpc"]
  }
}

# Get all public subnets in that VPC
data "aws_subnet" "public" {
  id = "subnet-04e8ddf790451d906"
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.login_key
  public_key = tls_private_key.my_key.public_key_openssh
}

# Save the private key to a file locally
resource "local_file" "private_key" {
  content  = tls_private_key.my_key.private_key_pem
  filename = "${path.terraform_module}/my-ubuntu-key.pem"
  file_permission = "0600"
}

resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = "t3.small"
  subnet_id     = data.aws_subnet.public.id

    tags = {
    Name = "${var.vname}-compute"
  }
}
