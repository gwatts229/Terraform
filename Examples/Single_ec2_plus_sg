# Specify provider

provider "aws" {
	region = "us-east-1"
}

# Create an example EC2 instance

resource "aws_instance" "apache_example" {
  ami = "ami-40d28157"
  instance_type="t2.micro"
# Tell the EC2 instnce to use the security group created below
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              service httpd start
              echo 'Hello!' > /var/www/html/index.html
              EOF

  tags {
    Name = "terraform-example"
    }
}

# Create a security group

resource "aws_security_group" "instance" {
  name = "terraform_example_instance"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
