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