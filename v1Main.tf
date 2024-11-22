provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "New_Web_Server" {
    
  instance_type          = "t2.micro"
  ami                    = "ami-012967cc5a8c9f891"
  key_name               = "SagarKey"
  vpc_security_group_ids = [aws_security_group.MyFirst_SG.id]

  tags = {
    Name = "Web_Server"
  }
}

resource "aws_security_group" "MyFirst_SG" {
  name = "MyFirstSG"
  ingress {
    to_port   = 22
    from_port = 22
    protocol  = "tcp"
  }

}

resource "aws_instance" "DB_Server" {
    instance_type          = "t2.micro"
  ami                    = "ami-012967cc5a8c9f891"
  key_name               = "SagarKey"
  vpc_security_group_ids = [aws_security_group.MyFirst_SG.id]

  tags = {
    Name = "DataBase_Server"
  }
  
}