resource "aws_security_group" "open" {
  name = "open"
  vpc_id = aws_vpc.vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 8081
    to_port = 8081
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 50022
    to_port = 52022
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 59000
    to_port = 59020
    protocol = "tcp"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "debian" {
  most_recent = true

  filter {
    name   = "name"
    values = ["debian-stretch-hvm-x86_64-*"]
  }

  owners = ["379101102735"]
}

resource "aws_key_pair" "ssh-key" {
  key_name   = "ssh-key-${var.stack.name}-${var.stack.id}"
  public_key = var.ssh_public_key
}

resource "aws_spot_instance_request" "master" {
  wait_for_fulfillment        = true
  spot_type                   = "one-time"
  block_duration_minutes      = var.master.spot_duration_mins

# resource "aws_instance" "master" {
  instance_type               = var.master.type
  ami                         = data.aws_ami.debian.id
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.open.id}"]
  subnet_id                   = aws_subnet.public.id
  key_name                    = aws_key_pair.ssh-key.key_name
  user_data                   = file("user-data.conf")
}

output "master" {
  value = aws_spot_instance_request.master.public_ip
  # value = aws_instance.master.public_ip
}
