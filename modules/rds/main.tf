resource "aws_db_subnet_group" "main" {
  name       = "mydbsubnetgroup"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "MyRDSSubnetGroup"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0.41"
  instance_class         = "db.t4g.micro"
  db_name                = var.db_name
  username               = var.username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = var.vpc_security_group_ids
  skip_final_snapshot    = true

  tags = {
    Name = "MyRDS"
  }
}
