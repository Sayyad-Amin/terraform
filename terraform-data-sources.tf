# Data sources in Terraform allow you to fetch existing resources in your AWS account
# without creating new ones. This is useful when you want to reference resources
# that were created manually or by another Terraform configuration.

# Fetch an existing AWS security group by its tag Name
data "aws_security_group" "name" {
  tags = {
    Name = "nginx-sg"  # Replace with the actual security group name in AWS
  }
}

# Output the security group details (this helps in debugging or referencing it in other resources)
output "name" {
  value = data.aws_security_group.name  # Output the fetched security group
}

#Fetch an existing VPC ID     # Its helpful when we have to create resources like ec2-instance in an exisitng vpc than data source help us a lot.
data "aws_vpc" "name" {
  tags = {
    Name = "my-aws_vpc"
  }
}

output "name" {
  value = data.aws_vpc.name.id
}
