data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["IaaSWeek-${var.hash_commit}"]
  }

  owners = ["777015859311"] # terraMy User
}

resource "aws_instance" "web" {
  #ami = "id da ami"
  provider = "aws.east"
  count = "var.servers"
  ami = "data.aws_ami.ubuntu.id"
  instance_type = "t2.micro"
  subnet_id     = "subnet-e12a3ea7"
  
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "west" {
  count = "var.servers"
  provider = "aws.west"
  ami = "ami-0e9aa7ba086c3544b"
  #ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = "subnet-554a8f30"
  
  tags = {
    Name = "HelloWorld"
  }
}