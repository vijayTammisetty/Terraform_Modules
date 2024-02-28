variable "layer" {
    type = string
    default = "aaaa"
  
}

variable "env" {
    type = string
    default = "bbbb"
  
}

variable "bucket_names" {
    type = list(string)
    default = [ "vijay", "omkar", "filkart" ]
  
}

variable "bucket_names_1" {
    type = list(string)
    default = [ "kumar", "balu", "amazon" ]
  
}