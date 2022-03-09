# IAM policy attached to an EC2 instance

resource "aws_instance" "ajongec2" {
  ami           = "ami-0e1d30f2c40c4c701" # "us-east-1"  # In work world you need to parametarize this value not hardcode
  instance_type = "t3.micro"
  iam_instance_profile = "${aws_iam_instance_profile.ec2_profile.name}"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "my_ec2_role"
  role = aws_iam_role.ajongec2_role.name
}