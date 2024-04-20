/*variable "string_type_var" {
  type = string
  description = "example of a string type variable"
  default = "value"
}



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
*/

#invalid number type

/*variable "number_type_ex_invalid" {
  type = number
  description = "example of invalid number type"
  default = "100 value"
}
*/

/*
variable "boolean_type_var" {
  type = bool
  description = "example of a bool type variable"
  default = true // "true"
}
*/
/*
variable "list_type_var" {
  type = list(string)
  description = "example of a list of string type variable"
  default = [ "value", "one", "100", true, 100 ]
}
*/
# list type invalid
/*
variable "list_type_var_invalid" {
  type = list(string)
  description = "example of a list of string type variable"
  default = [ "value", "one", "100", true, 100, {key = "value"} ]
}
*/
/*
variable "list_any_type_var" {
  type = list(any)
  description = "example of a list of any type variable"
  default = [ "one", 2, true, {name = "giri"} ]

}
*/

/*
variable "map_type_var" {
  type = map
  description = "example of a map type variable"
  default = {
    environment = "dev"
    cost_centre = 2204043
    bool_type = true
    project = "learning aws"
  }
}
*/
/*
variable "any_type_example_02_var" {
  type = any
  description = "another example of a complex map type variable"
  default = {
    env = "dev"
    resource_created = false
    total_resource_count = 25
    resources_by_category = {
        network = ["vpc", "firewal", "sg"]
        app_service = "web app"
        security = ["guard duty"]
        monitoring = {
            logs = ["log analytics", "storage"]
            metrics = "log analytics"
            retention_type = 90
            policy_enabled = false
        }
    }
  }
}
*/

variable "object_type_var" {
  description = "describe your variable"
  type = object({
    first_name = string
    last_name = string
    age = number
  })
  default = {
    age = "1"
    first_name = "john"
    last_name = "smith"
  }
}


variable "map_example" {
  type = map
  default = {
    first_name = "john"
    last_nam = "annie"
    last_nam = "smith"
    age = 1
  }
}