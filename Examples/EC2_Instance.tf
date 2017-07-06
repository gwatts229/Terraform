# Specify provider

provider "aws" {
	region = "us-east-1"
}

# Create an example EC2 instance

resource "aws_instance" "apache_example" {
  ami = "ami-40d28157"
  instance_type="t2.micro"
}
