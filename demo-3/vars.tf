#Here only the declaration of 
#variables takes place.
#The empty curly braces indicate that
#only variables are declared and not defined.
variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {}

# The AMIS variable is defined here.
variable "AMIS" {
  type = "map"

  default = {
    us-east-1  = "ami-13be557e"
    us-west-2  = "ami-06b94666"
    eu-west-1  = "ami-0d729a60"
    ap-south-1 = "ami-0189d76e"
  }
}

# The PATH_TO_PRIVATE_KEY variable is defined here.
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

# The PATH_TO_PUBLIC_KEY variable is defined here.
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

# The INSTANCE_USERNAME variable is defined here.
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
