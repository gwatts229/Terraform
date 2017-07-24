############
# Provider #
############

provider "aws" {
  region = "${var.region}"
}

########
# Data #
########

# Add in the following template file to reference user data as a file

data "template_file" "user_data" {
  template = "${file("user_data.sh")}"

 vars {
  Sumo_Logic_Access_ID = "${var.Sumo_Logic_Access_ID}"
  Sumo_Logic_Access_Key = "${var.Sumo_Logic_Access_Key}"
  Sumo_Collector_Download_URL = "${lookup(var.Sumo_Collector_Download_URL, var.Sumo_Logic_Region)}"
 }
}

#######
# EC2 #
#######

# Launch this stack in any region with a flag in your terraform apply command
# Launch in us-west-2: /path_to_terraform/terraform apply -var region=us-west-2

resource "aws_instance" "example" {
  # Ubuntu_AMIs refers to the mapping of Ubuntu community AMIs in the vars.tf file
  ami             = "${lookup(var.Amazon_Linux_AMIs, var.region)}"
  instance_type   = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  # Uncomment this line if you allow ingress port 22 (SSH) access to your EC2s, and make sure to replace the name with your local key name
  # key_name = "tf-east-1-key"

  user_data = "${data.template_file.user_data.rendered}"

	tags {
		Name = "terraform-example-server"
	}
}

##################
# Security Group #
##################

resource "aws_security_group" "instance" {
	name = "terraform-exmaple-instance"

#  description = "Allow all 80, 443"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Allow all 80, 443"
  }
}
