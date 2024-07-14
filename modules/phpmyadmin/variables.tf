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

variable "pmahost" {
    type        = string
    description = "Environment Variable PMA_HOST"
}

variable "pmaport" {
    type        = string
    description = "Environment Variable PMA_PORT"
}

variable "mysqlrootpass" {
    type        = string
    description = "MYSQL ROOT Password"
}