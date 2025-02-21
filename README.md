## Terraform

#### Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp that allows you to define, provision, and manage cloud infrastructure using declarative configuration files.

#### Terraform stores resource information in a state file (terraform.tfstate) to track infrastructure changes.

### Steps to Configure S3 Static Website Hosting with Terraform

##### Ensure the S3 bucket exists (skip bucket creation if already created).
##### Set Public Access Block settings to allow public access.
##### Enable S3 Static Website Hosting by defining the website configuration.
##### Attach an S3 Bucket Policy to allow public read access to objects.
##### Upload website files (index.html and style.css) to the S3 bucket.
##### Apply Terraform Configuration (terraform init, terraform apply).
##### Retrieve the S3 Static Website URL from the AWS Management Console or Terraform output.


