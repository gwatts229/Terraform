variable "region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "Sumo_Logic_Region" {
  description = "Sumo Logic Region - US1, US2, DUB, or SYD"
  default     = "US2"
}

variable "Sumo_Logic_Access_ID" {
  description = "Sumo Logic collector Access ID"
}

variable "Sumo_Logic_Access_Key" {
  description = "Sumo Logic collector Access Key"
}

# Sumo Logic documentation for collector downloads here: https://help.sumologic.com/Send_Data/Installed_Collectors/05Reference_Information_for_Collector_Installation/02Download_a_Collector_from_a_Static_URL
variable "Sumo_Collector_Download_URL" {
  description = "Map of Sumo Logic's Collector Download endpoints for 64 bit Linux machines"
  type = "map"

  default = {
    US2= "https://collectors.us2.sumologic.com/rest/download/linux/64"
    DUB= "https://collectors.eu.sumologic.com/rest/download/linux/64"
    SYD = "https://collectors.au.sumologic.com/rest/download/linux/64"
  }
}

variable "Amazon_Linux_AMIs" {
  description = "Map of Linux AMI (September 2016) across all AWS Regions"
  type = "map"

  default = {
    us-east-1= "ami-c481fad3"
    us-east-2="ami-71ca9114"
    us-west-1= "ami-de347abe"
    us-west-2= "ami-b04e92d0"
    ca-central-1= "ami-eb20928f"
    eu-west-1= "ami-d41d58a7"
    eu-central-1= "ami-0044b96f"
    eu-west-2= "ami-bfe0eadb"
    ap-southeast-1= "ami-7243e611"
    ap-southeast-2= "ami-55d4e436"
    ap-northeast-2= "ami-a04297ce"
    ap-northeast-1= "ami-1a15c77b"
    ap-south-1= "ami-cacbbea5"
    sa-east-1= "ami-b777e4db"
  }
}
