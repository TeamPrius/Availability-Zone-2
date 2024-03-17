# security group for Presentation Layer
resource "aws_security_group" "presentation_layer_sg_availability_zone_2" {
  name        = "Pres-SG-Availability-Zone-2"
  description = "Security group for Presentation Layer of availability zone 2"
  vpc_id      = aws_vpc.prod_vpc.id

  tags = {
    Name = "Pres-SG-Availability-Zone-2"
  }
}


# incoming rules

# allow http access from internet
resource "aws_vpc_security_group_ingress_rule" "presentation_layer_ingr_availability_zone_2" {
  security_group_id = aws_security_group.presentation_layer_sg_availability_zone_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port = 80  
  to_port = 80
  ip_protocol = "tcp"
}


# outgoing rules
resource "aws_vpc_security_group_egress_rule" "presentation_layer_egr_availability_zone_2" {
  security_group_id = aws_security_group.presentation_layer_sg_availability_zone_2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
###########################################################################################


# security group for Business Logic Layer
resource "aws_security_group" "business_logic_layer_sg_availability_zone_2" {
  name        = "Bus-Log-Layer-SG-Availability-Zone-2"
  description = "Security group for Business Logic Layer of availability zone 2"
  vpc_id      = aws_vpc.prod_vpc.id

  tags = {
    Name = "Bus-Log-Layer-SG-Availability-Zone-2"
  }
}


# incoming rules

# allow http access from internet
resource "aws_vpc_security_group_ingress_rule" "business_logic_layer_ingr_availability_zone_2" {
  security_group_id = aws_security_group.business_logic_layer_sg_availability_zone_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port = 80  
  to_port = 80
  ip_protocol = "tcp"
}


# outgoing rules
resource "aws_vpc_security_group_egress_rule" "business_logic_layer_egr_availability_zone_2" {
  security_group_id = aws_security_group.business_logic_layer_sg_availability_zone_2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
###########################################################################################


# security group for Data Storage Layer
resource "aws_security_group" "data_storage_layer_sg_availability_zone_2" {
  name        = "Data-Stor-Layer-SG-Availability-Zone-2"
  description = "Security group for Data Storage Layer of availability zone 2"
  vpc_id      = aws_vpc.prod_vpc.id

  tags = {
    Name = "Data-Stor-Bus-Log-Layer-SG-Availability-Zone-2"
  }
}


# incoming rules

# allow mysql access
resource "aws_vpc_security_group_ingress_rule" "data_storage_layer_ingr_availability_zone_2" {
  security_group_id = aws_security_group.data_storage_layer_sg_availability_zone_2.id
  from_port = 3306 
  to_port = 3306
  ip_protocol = "tcp"
  referenced_security_group_id = aws_security_group.business_logic_layer_sg_availability_zone_2.id
}


# outgoing rules
resource "aws_vpc_security_group_egress_rule" "data_storage_layer_egr_availability_zone_2" {
  security_group_id = aws_security_group.data_storage_layer_sg_availability_zone_2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
###########################################################################################


# security group for Load Balancer
resource "aws_security_group" "lb_sg" {
  name        = "LB-SG"
  description = "Security group for Load Balancer"
  vpc_id      = aws_vpc.prod_vpc.id

  tags = {
    Name = "LB-SG"
  }
}


# incoming rules

# allow http access from internet
resource "aws_vpc_security_group_ingress_rule" "lb_sg_ingr" {
  security_group_id = aws_security_group.lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port = 80  
  to_port = 80
  ip_protocol = "tcp"
}


# outgoing rules
resource "aws_vpc_security_group_egress_rule" "lb_sg_egr" {
  security_group_id = aws_security_group.lb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}