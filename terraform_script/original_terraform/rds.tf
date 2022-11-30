//SECURITY GROUP
resource "aws_security_group" "secgrp-rds" {

  name        = "secgrp-rdis"
  description = "Allow MySQL Port"
  vpc_id          = module.vpc.vpc_id

  ingress {
    description = "Allowing Connection for mysql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allowing Connection for SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_db_subnet_group" "sub_ids" {
  name =var.database_group
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "DB subnet group"
  }
}

data "aws_availability_zones" "available" {}

//RDS INSTANCE
resource "aws_db_instance" "rds" {
  depends_on=[aws_security_group.secgrp-rds]
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  availability_zone    = data.aws_availability_zones.available.names[0]
  backup_retention_period = 1 
  allocated_storage    = 20
  storage_type         = "gp2"
  db_name              =  var.database_name
  identifier           =  var.database_name
  username             = "root"
  password             = "test12345"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  skip_final_snapshot = true
  apply_immediately   = true
  iam_database_authentication_enabled = true
  db_subnet_group_name = aws_db_subnet_group.sub_ids.id
  vpc_security_group_ids = [aws_security_group.secgrp-rds.id]
}

resource "aws_db_instance" "rds_replica" {
   #name                   = "rds-replica"
   identifier             = "rds-replica"
   availability_zone      = data.aws_availability_zones.available.names[1]
   replicate_source_db    = aws_db_instance.rds.identifier
   instance_class         = "db.t3.micro"
   apply_immediately      = true
   publicly_accessible    = true
   skip_final_snapshot    = true
   vpc_security_group_ids = [aws_security_group.secgrp-rds.id]
   parameter_group_name   = "default.mysql5.7"
}

resource "aws_db_instance" "rds_replica-2" {
   #name                   = "rds-replica-2"
   identifier             = "rds-replica-2"
   availability_zone      = data.aws_availability_zones.available.names[2]
   replicate_source_db    = aws_db_instance.rds.identifier
   instance_class         = "db.t3.micro"
   apply_immediately      = true
   publicly_accessible    = true
   skip_final_snapshot    = true
   vpc_security_group_ids = [aws_security_group.secgrp-rds.id]
   parameter_group_name   = "default.mysql5.7"
}
