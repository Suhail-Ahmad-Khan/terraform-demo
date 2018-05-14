# we need to create our own ssh key-pair in the same directory
# for use while connecting to EC2 instances.
resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.mykey.key_name}"

  # The file provisioner is used to copy files or directories 
  # from the machine executing Terraform to the newly created resource
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  # The remote-exec provisioner invokes a script on a remote resource 
  # after it is created. This can be used to run a configuration 
  # management tool, bootstrap into a cluster, etc
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  # Many provisioners require access to the remote resource. 
  # For example, a provisioner may need to use SSH or WinRM 
  # to connect to the resource.
  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
