# create ebs volume
resource "aws_ebs_volume" "presentation_layer_ebs_availability_zone_2" {
  availability_zone = "us-east-1b"
  type              = "gp3"                     # consider if gp2 is cheaper
  #encrypted        =                           # perhaps add encryption
  size              = 5
  #kms_key_id       =                           # perhaps add encryption
}


# ebs volume attachment
resource "aws_volume_attachment" "presentation_layer_ebs_volume_attach_availability_zone_2" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.presentation_layer_ebs_availability_zone_2.id
  instance_id = aws_instance.business_logic_tier_availability_zone_2.id
}