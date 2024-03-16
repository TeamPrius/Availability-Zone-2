# create elastic ip address for VPC
resource "aws_eip" "eip_availability_zone_2" {
  #domain = "vpc"
  depends_on = [
    aws_route_table_association.pres_layer_rta_availability_zone_2
  ]
  vpc        = true
}
