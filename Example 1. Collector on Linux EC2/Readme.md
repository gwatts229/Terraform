# Use Terraform to launch a Linux AMI with Sumo Logic built-in

This example Terraform repo shows how to automaticaly deploy a Sumo Logic collector on a Linux EC2 instance in a Security Group within your default VPC.

The goal is to show how Sumo Logic's collector agent can be automatically integrated into your Terraform-deployed EC2s.

To test, you will need:

0. Terraform
1. A Sumo Logic account (sign up for free here: https://www.sumologic.com/signup-free/?utm_medium=sales+email)
- You'll need to download an Sumo Logic collector management key pair later
2. Access to your AWS account
- AmazonEC2FullAccess permissions
3. AWS User key pair
- You can export these in your shell session one time:
> export AWS_Access_Key_ID=(your_ID)

> export AWS_Secret_Access_key=(your_key)
- Or if you have already set up the AWS CLI or SDKs in your local environment, Terraform can use the credentials stored at $home/.aws/credentials which is created for you after running the configure command on the AWS CLI


## Instructions

1. First, copy this repo (Example 1. Collector on Linux EC2) somewhere locally. 
- You'll need all 3 files: main.tf, vars.tf, and user_data.sh
- main.tf will use user_data.sh to bootstrap your EC2, and will use vars.tf to perform lookups based on a Linux AMI map, a Sumo Logic collector endpoint map, and some other variables
2. Then, test out Terraform by running: 
```/path/to/terrafom plan```
- There are some configurable variables built in. For exmaple, the default AWS Region that this EC2 will be launched into is us-east-1, but you can pass in another region like this:
```path/to/terraform /terraform apply -var region=us-west-2```
