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

# Output subnet IDs
output "public_subnet_ids" {
  value = data.aws_subnets.public.ids
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
  filename = "${path.module}/my-ubuntu-key.pem"
  file_permission = "0600"
}

resource "aws_instance" "my_ec2" {
  ami             = "ami-0885b1f6bd170450c"  # Ubuntu 22.04 LTS in us-east-1
  instance_type   = "t2.micro"
  subnet_id       = data.aws_subnet.data_subnets.id  
  security_groups = [aws_security_group.my_sg.name]
  key_name        = aws_key_pair.key_pair.key_name

    tags = {
    Name = "${var.vname}-compute"
  }
}
