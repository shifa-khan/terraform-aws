resource "aws_s3_bucket" "example" {
  bucket = "name-of-the-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
