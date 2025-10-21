# Get existing VPC
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["host-vpc"]
  }
}

# Get all public subnets in that VPC
data "aws_subnets" "public" {
  filter {
    name   = "host-public-subnet-1"
    values = [data.aws_vpc.vpc.id]
  }

  filter {
    name   = "tag:Type"
    values = ["public"]
  }
}

# # Get all private subnets in that VPC
# data "aws_subnets" "private" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.selected.id]
#   }

#   filter {
#     name   = "tag:Type"
#     values = ["private"]
#   }
# }

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
  filename = "${path.module}/my-ubuntu-key.pem"
  file_permission = "0600"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnets.public.id

    tags = {
    Name = "${var.vname}-compute"
  }
}
