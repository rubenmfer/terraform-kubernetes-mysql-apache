module "webapp" {
    source          = "./modules/webapp"
    name            = "miwebapp"
    replicas        = 1
    imgdocker       = "miwebapp:0.0.1"
    port            = 80
    portprotocol    = "TCP"
}

module "mysql" {
    source          = "./modules/mysql"
    name            = "mysql"
    replicas        = 1
    imgdocker       = "mysql:latest"
    port            = 3306
    portprotocol    = "TCP"
    createsql       = "create_table.sql"    
    mysqlrootpass   = var.mysqlrootpass
    mysqldb         = var.mysqldb
    mysqluser       = var.mysqluser
    mysqluserpass   = var.mysqluserpass
}

module "phpmyadmin" {
    source          = "./modules/phpmyadmin"
    name            = "phpmyadmin"
    replicas        = 1
    imgdocker       = "phpmyadmin/phpmyadmin"
    port            = 80
    portprotocol    = "TCP"
    pmahost         = "mysql"
    pmaport         = 3306
    mysqlrootpass   = var.mysqlrootpass
}