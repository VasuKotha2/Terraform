output "output_string_type" {
  value = var.string_type_var
}

output "output_number_type_var" {
  value = var.number_type_var
}

output "output_number_type_ex_02_var" {
  value = var.number_type_ex_02_var
}

# invalid number type example
# output "output_number_type_ex_invalid" {
#  value = var.number_type_ex_invalid
# }

output "output_boolean_type_var" {
  value = var.boolean_type_var
}


output "output_list_type_var" {
  value = var.list_type_var
}



output "output_list_type_var" {
  value = var.list_type_var[4]
}

#invalid list type example
/*output "output_list_type_var_invalid" {
  value = var.list_type_var_invalid
}
*/

output "output_2nc_index_of_list" {
  value = var.list_type_var[1]
}

/*output "output_list_any_type_var" {
  value = var.list_any_type_var
}
*/


output "output_environment_key_from_map_type_var" {
  value = var.map_type_var[]
}

output "output_environment_key_from_map_type_var2" {
  value = var.map_type_var["cost_centre"]
}



output "any_type_example_02_var" {
  value = var.any_type_example_02_var
}


output "specific_key_from_any_type_example_02_var" {
  value = var.any_type_example_02_var.total_resource_count
}


output "specific_key_from_any_type_example_02_var" {
  value = var.any_type_example_02_var.resources_by_category.monitoring.logs[0]
}


output "output_object_type_var" {
  value = var.object_type_var
}

output "output_map" {
  value = var.map_example
}