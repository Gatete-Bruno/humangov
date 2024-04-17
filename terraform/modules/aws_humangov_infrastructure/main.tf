resource "aws_security_group" "state_ec2_sg" {  
  name        = "humangov-${var.state_name}-ec2-sg"  
  description = "Allow traffic on ports 22 and 80"  
  
  ingress {  
    from_port   = 22  
    to_port     = 22  
    protocol    = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]  
  }  
  
  ingress {  
    from_port   = 80  
    to_port     = 80  
    protocol    = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]  
  }  
  
  tags = {  
    Name = "humangov-${var.state_name}"  
  }  
}

resource "aws_instance" "state_ec2" {  
  ami           = "ami-04e5276ebb8451442"  #AMI for our region 
  instance_type = "t2.micro"  
  key_name = "humangov-ec2-key"  
  vpc_security_group_ids = [aws_security_group.state_ec2_sg.id]  
  
  tags = {  
    Name = "humangov-${var.state_name}"  
  }  
}

resource "aws_dynamodb_table" "state_dynamodb" {  
  name           = "humangov-${var.state_name}-dynamodb"  
  billing_mode   = "PAY_PER_REQUEST"  
  hash_key       = "id"  
  
  attribute {  
    name = "id"  
    type = "S" #Type String  
  }  
  
  tags = {  
    Name = "humangov-${var.state_name}"  
  }  
}