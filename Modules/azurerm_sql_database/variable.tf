variable "sql_db" {
  description = "A map of SQL Database configurations."
  type = map(object({
    name         = string
    collation    = optional(string)
    license_type = optional(string)
    max_size_gb  = optional(number)
    sku_name     = optional(string)
    enclave_type = optional(string)
    tags         = optional(map(string))
  }))

}
variable "sql_db_server" {
    description = "A map of SQL Database Server configurations."
    type = map(string)
  
}
