# create db subnet group for rds
resource "aws_db_subnet_group" "rds_instance_availability_zone_2" {
  name       = "rds_instance_availability_zone_2"
  subnet_ids = [aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_4.id]

  tags = {
    Name = "DB subnet group for database in availability zone 2"
  }
}


