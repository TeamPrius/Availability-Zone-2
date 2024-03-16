# Presentation Layer Public Route Table
resource "aws_route_table" "pres_layer_rt_availability_zone_2" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_vpcigw.id
  }
}


# create public route table association
resource "aws_route_table_association" "pres_layer_rta_availability_zone_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.pres_layer_rt_availability_zone_2.id
}
###########################################################################################


# Business Logic Layer Public Route Table
resource "aws_route_table" "bus_log_layer_rt_availability_zone_2" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_vpcigw.id
  }
}


# create public route table association
resource "aws_route_table_association" "bus_log_layer_rta_availability_zone_2" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.bus_log_layer_rt_availability_zone_2.id
}
###########################################################################################


# Database Storage Layer Private Route Table
resource "aws_route_table" "data_stor_layer_rt_availability_zone_2" {
  vpc_id = aws_vpc.prod_vpc.id
}


# create private route table association
resource "aws_route_table_association" "data_stor_layer_rta_availability_zone_2" {
  subnet_id      = aws_subnet.private_subnet_4.id
  route_table_id = aws_route_table.data_stor_layer_rt_availability_zone_2.id
}
###########################################################################################



