variable "number_type_var" {
  type = number
  description = "example of a number type variable"
  default = 20.99
}

variable "number_type_ex_02_var" {
  type = number
  description = "another example of a number type variable"
  default = "100"
}

# Below variable generates an error
variable "number_type_ex_03_var" {
  type = string
  description = "example of a number type variable"
  default = 20.99
}
