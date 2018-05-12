resource "aws_instance" "terraform_instance" {
  ami           = "ami-0189d76e"
  instance_type = "t2.micro"
}
