# Architecture
![alt text](https://d2908q01vomqb2.cloudfront.net/cb4e5208b4cd87268b208e49452ed6e89a68e0b8/2017/02/07/vpc-architecture.png "AWS Architecture")

# Instalar o terraform 

### <https://www.terraform.io/downloads.html>
```
/usr/local/bin/terraform
```
##############################################################

# AWS Provider provider.tf

# Define AWS as our provider
```
provider "aws" {
  access_key = "ACCESS_KEY_HERE"
  secret_key = "SECRET_KEY_HERE"

  profile = "lab"
  region = "${var.aws_region}"
}
```
```
terraform init
```
##############################################################

# AWS Instance
```
resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
```
```
terraform plan
terraform apply
terraform show
```

##############################################################

# Change AWS Instance ami
```
resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"
}
```
```
terraform apply
```
##############################################################

# Destroy Infrastructure

```
terraform destroy 
```
##############################################################

# Provisioning
```
resource "aws_instance" "example" {
  ami           = "ami-b374d5a5"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
```


```
terraform apply
```

##############################################################

# Variables
```

variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
```


# Using variables
```
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
```
```
terraform apply \
  -var 'access_key=foo' \
  -var 'secret_key=bar'
```
# From file terraform.tfvars

```
access_key = "foo"
secret_key = "bar"
```
```
terraform apply \
  -var-file="secret.tfvars" \
  -var-file="production.tfvars"
```


# Environment Variables
```
export TF_VAR_access_key=####
```

# Tipos de Variáveis

## Lists

### implicitly by using brackets [...]
```
variable "cidrs" { default = [] }
```

### explicitly
```
variable "cidrs" { type = "list" }
```
```
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
```

## Maps

```
variable "amis" {
  type = "map"
  default = {
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}
```
```
resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
}
```

### Assigning Maps

```
terraform apply -var 'amis={ us-east-1 = "foo", us-west-2 = "bar" }'
```

```
variable "region" {}
variable "amis" {
  type = "map"
}
```
### In a terraform.tfvars file:
```
amis = {
  "us-east-1" = "ami-abc123"
  "us-west-2" = "ami-def456"
}
```

### Access them via lookup():
```
output "ami" {
  value = "${lookup(var.amis, var.region)}"
}
```

```
terraform apply -var region=us-west-2
```

## Output Variables

```
output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
```

### Output using 

```
terraform apply
```
```
terraform output ip
```

# Modules

```

```