variable "region" {
  default = "us-west-2"
}
#you can by pass these variables (access and secret ) and login using aws configure command.
variable "secret_key" {
  default = "enter your secret access key"
}

variable "access_key" {
  default = "enter your access key"
}

variable "cidr_block-vpc" {
  type = list(object({
    cidr_block = string,
    name       = string

  }))
  default = [{ cidr_block = "172.16.0.0/16", name = "cidr_172_vpc" },
  { cidr_block = "10.0.0.0/16", name = "cidr_10_block" }]
}

variable "cidr_block-subnet" {
  type    = list(string)
  default = ["172.16.0.0/24", "10.0.0.0/24"]
}

variable "availability_zone" {
  default = "us-west-2a"
}
variable "instance_ip" {
  default = ["172.16.0.100"]
}
variable "ami" {
  default = "ami-00970f57473724c10"
}

variable "instance_type" {
  default = "t2.micro"
}
