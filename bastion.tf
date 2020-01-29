data "aws_subnet" "bastion_subnet_id" {
  filter {
    name = "tag:Name"
    values = [
      format(
        "public-%s-%s%s",
        var.vpc_name,
        var.region,
        var.bastion_zone
    )]
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = [
  "amazon"]

  filter {
    name = "name"
    values = [
      "amzn-ami-hvm-*-x86_64-gp2",
    ]
  }

  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}

module "bastion_one" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.12.0"

  instance_count = 1

  name          = format("bastion-%s", var.bastion_zone)
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.bastion_subnet_id.id
  vpc_security_group_ids = [
  module.ssh_sg.this_security_group_id]
  associate_public_ip_address = true
}
