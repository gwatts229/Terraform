# Use Terraform to launch a Linux AMI with Sumo Logic built-in

This example Terraform repo shows how to automaticaly deploy a Sumo Logic collector on a Linux EC2 instance in a Security Group within your default VPC.


## Prerequisites ##

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
- You can safely enter 'test' for the var.Sumo_Logic_Access_ID and var.Sumo_Logic_Access_Key inputs while you are testing with ```plan```

3. Run Terraform and create your EC2
- There are some configurable variables built in. For exmaple, the default AWS Region that this EC2 will be launched into is us-east-1, but you can pass in another region like this:
```path/to/terraform /terraform apply -var region=us-west-2```
- If your Sumo Logic Deployment is in another Region, like DUB or SYD, you can run the command like this:
```path/to/terraform /terraform apply -var Sumo_Logic_Region=SYD```

4. Terrafrom will interactively ask you for your Sumo Logic Access Key pair - generate a key pair inside Sumo logic and enter it now
- In the Sumo Logic Web Application click your name in the left nav and open the Preferences page
- Next to My Access Keys, click the + icon to Add
- See the official Sumo Logic documentation here: https://help.sumologic.com/Manage/Security/Access-Keys

5. Done! After about 2-3 minutes, check under Manage Data > Collection in the Sumo Logic UI and you should see you new collector running and scanning the sources we specified in the sources.json (Linux OS logs, Cron log, and Host Metrics)

**Bonus**
- Install the Sumo Logic Aplpications for Linux and Host Metrics to get pre-built reports and dashboards:
  - Linux: https://help.sumologic.com/Send-Data/Data_Types/Linux/Install_the_Linux_App
  - Host Metrics: https://help.sumologic.com/Send-Data/Data_Types/Host_Metrics/02Install_the_Host_Metrics_App
