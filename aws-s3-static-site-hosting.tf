# Enable public access settings for the existing S3 bucket
resource "aws_s3_bucket_public_access_block" "allow_public_access" {
  bucket = "alnafi-2c6db4cacc982452"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Define the S3 bucket website configuration
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = "alnafi-2c6db4cacc982452"

  index_document {
    suffix = "index.html"
  }
}

# Attach a public read policy to allow access to objects in the S3 bucket
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = "alnafi-2c6db4cacc982452"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "arn:aws:s3:::alnafi-2c6db4cacc982452/*"
      }
    ]
  })
}

# Upload index.html file to the S3 bucket
resource "aws_s3_object" "index_html" {
  bucket        = "alnafi-2c6db4cacc982452"
  source        = "./index.html"
  key           = "index.html"
  content_type  = "text/html"
}

# Upload style.css file to the S3 bucket
resource "aws_s3_object" "style_css" {
  bucket        = "alnafi-2c6db4cacc982452"
  source        = "./style.css"
  key           = "style.css"
  content_type  = "text/css"
}
