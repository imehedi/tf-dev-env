variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "vpc_name" {
  type    = string
  default = "mh_dev_vpc"
}


variable "env_name" {
  type    = string
  default = "development"
}

variable "ip_source" {} # value for this variable will be picked up from github secrets

variable "bastion_zone" {
  type    = string
  default = "a"
}