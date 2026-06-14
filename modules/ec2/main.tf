data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_security_group" "ec2" {
  name        = "${var.environment}-ec2-sg"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidrs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.environment}-ec2-sg"
  })
}

resource "aws_instance" "main" {
  count                = var.instance_count
  ami                  = var.ami_id != null ? var.ami_id : data.aws_ami.ubuntu.id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_ids[count.index % length(var.subnet_ids)]
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile

  vpc_security_group_ids = [aws_security_group.ec2.id]

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
    encrypted             = var.enable_encryption
  }

  monitoring             = var.enable_detailed_monitoring
  associate_public_ip_address = var.associate_public_ip_address

  user_data = var.user_data

  tags = merge(var.tags, {
    Name = "${var.environment}-ec2-${count.index + 1}"
  })

  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_volume_attachment" "extra" {
  count           = var.instance_count * length(var.additional_volumes)
  device_name     = var.additional_volumes[count.index % length(var.additional_volumes)].device_name
  volume_id       = aws_ebs_volume.extra[count.index].id
  instance_id     = aws_instance.main[floor(count.index / length(var.additional_volumes))].id
}

resource "aws_ebs_volume" "extra" {
  count             = var.instance_count * length(var.additional_volumes)
  availability_zone = aws_instance.main[floor(count.index / length(var.additional_volumes))].availability_zone
  size              = var.additional_volumes[count.index % length(var.additional_volumes)].size
  type              = var.additional_volumes[count.index % length(var.additional_volumes)].type
  encrypted         = var.enable_encryption

  tags = merge(var.tags, {
    Name = "${var.environment}-ebs-${count.index + 1}"
  })
}
