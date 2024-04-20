variable "instance_ami_web"{
type = map(string)
description = "web instance ami and app instance ami"
default = {
    web = "ami-007020fd9c84e18c7"
    app = "ami-0a1b648e2cd533174"
}
}
variable "instance_instancetype" {
  type = map(string)
  description = "web instance type"
  default = {
    web = "t2.micro"
    app = "t3.micro"
  }
}
