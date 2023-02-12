data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  vpc_security_group_ids=["sg-0887aa163112f7ffd"]
  subnet_id="subnet-095613cb4cf35cccf"
  tags = {
    Name = "HelloWorld"
  }
}
