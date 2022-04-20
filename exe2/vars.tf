variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {

  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-03ededff12e34e59e"
    us-east-2 = "ami-0c7478fd229861c57"
  }
}