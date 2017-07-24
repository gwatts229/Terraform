This example Terraform repo shows how to spin up Linux EC2 instances in a Security Group within your default VPC.

The goal is to show how Sumo Logic's collector agent can be automatically integrated into your Terraform stack.

To test, you will need:

0. Terraform
1. A Sumo Logic account (sign up for free here: https://www.sumologic.com/signup-free/?utm_medium=sales+email)
2. Access to an AWS account - you'll need to download an Sumo Logic collector management key pair later
3. AmazonEC2FullAccess permissions
4. AWS User key pair
- You can export these in your shell session one time:
> export AWS_Access_Key_ID=(your_ID)
> export AWS_Secret_Access_key=(your_key)
- Or if you have already set up the AWS CLI or SDKs in your local environment, Terraform can use the credentials stored at $home/.aws/credentials which is created for you after running the configure command on the AWS CLI
