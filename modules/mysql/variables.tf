variable "name" {
    type        = string
    description = "name"
}

variable "replicas" {
    type        = number
    description = "number of replicas"
}

variable "imgdocker" {
    type        = string
    description = "name image docker"
}

variable "port" {
    type        = number
    description = "number of port"
}

variable "portprotocol" {
    type        = string
    description = "protocol service"
}

variable "createsql" {
    type        = string
    description = "file sql create table"
}

variable "mysqlrootpass" {
    type        = string
    description = "MYSQL ROOT Password"
}

variable "mysqldb" {
    type        = string
    description = "MYSQL DataBase"
}

variable "mysqluser" {
    type        = string
    description = "MYSQL User"
}

variable "mysqluserpass" {
    type        = string
    description = "MYSQL Pasword User"
}

