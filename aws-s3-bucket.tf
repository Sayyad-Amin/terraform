resource "random_id" "random_id" {    #There is an issue creating bucket aws says it should be universally unique everytime so we are using this random_id resource
  byte_length = 8
}

resource "aws_s3_bucket" "test-data" {
    bucket = "alnafi-${random_id.random_id.hex}"
}

resource "aws_s3_object" "bucket-data" {  #Everthing will go inside a bucket in the form of object.
  bucket = aws_s3_bucket.test-data.bucket
  source = "./myfile.txt"
  key = "mydata.txt"
}
