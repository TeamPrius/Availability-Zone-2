resource "aws_db_instance" "rds_availabiliyu_zone_2" {
  # basic information
  db_name                = "rds_availability_zone_2"      # name of rds volume
  availability_zone      = "us-east-1b"                   # availability zone of rds volume
  db_subnet_group_name   = aws_subet.private_subnet_4.id  # id of subnet rds volume is in
  engine                 = "mysql"                        # we use mysql engine
  instance_class         = db.t2.micro                    # choose t2 micro instance class

  # storage information
  allocated_storage      = 5                              # size of allocated storage in gb
  max_allocated_storage  = 20                             # max storage in gb

  # security information
  deletion_protection    = true                           # protect against deletion of backup          =
  publicly_accessible    = false                          # prevent public access
  vpc_security_group_ids = [aws_security_group.appsg.id]  # get security group id

  # authentication
  username               = "supersecurerdsusername"       # username for rds volume
  password               = "supersecurerdspassword"       # password for rds volume

  # KMS key information
  #kms_key_id 
}