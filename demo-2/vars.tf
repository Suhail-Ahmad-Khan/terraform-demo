#Here only the declaration of 
#variables takes place.
#The empty curly braces indicate that
#only variables are declared and not defined.

#Only the AMIS variable is defined here.
variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1  = "ami-13be557e"
    us-west-2  = "ami-06b94666"
    eu-west-1  = "ami-0d729a60"
    ap-south-1 = "ami-0189d76e"
  }
}
