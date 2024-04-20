output "output_number_type_var" {
  value = var.number_type_var
}

output "output_number_type_ex_02_var" {
  value = var.number_type_ex_02_var
}

# Below output generates an error
output "output_number_type_ex_03_var" {
  value = var.number_type_ex_02_var
}
