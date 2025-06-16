data "aws_ssm_parameter" "amzn2_latest" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "app_server" {
  ami                    = data.aws_ssm_parameter.amzn2_latest.value
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name

  tags = {
    Name = "MyEC2"
  }
}

# 起動テンプレートID
# lt-081a3ceeb2c019ec5

# amiID
# ami-0bb2c57f7cfafb1cb

# resource "aws_launch_template" "foobar" {
#   name_prefix   = "foobar"
#   image_id      = "ami-0bb2c57f7cfafb1cb"
#   instance_type = "t2.micro"
# }

# resource "aws_autoscaling_group" "bar" {
#   availability_zones = ["us-east-1a"]
#   desired_capacity   = 1
#   max_size           = 2
#   min_size           = 1

#   launch_template {
#     id      = aws_launch_template.foobar.id
#     version = "$Latest"
#   }
# }
