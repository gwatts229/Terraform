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
              echo "I'm a server" > index.html
              nohup busybox httpd -f -p -8080 &
              EOF

  tags {
    Name = "terraform-example"
    }
}

# Create a security group

resource "aws_security_group" "instance" {
  name = "terraform_example_instance"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
