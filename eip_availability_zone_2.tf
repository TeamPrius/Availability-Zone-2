# create elastic ip address for VPC
resource "aws_eip" "nat" {
  domain = "vpc"
}



