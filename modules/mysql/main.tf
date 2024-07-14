resource "kubernetes_deployment" "mysql" {
    metadata {
        name = var.name
    }

    spec {
        replicas = var.replicas

        selector {
            match_labels = {
                app = var.name
            }
        }

        template {
            metadata {
                labels = {
                    app = var.name
                }
            }

            spec {
                container {
                    name = var.name
                    image = var.imgdocker
                    env {
                        name    = "MYSQL_ROOT_PASSWORD"
                        value_from {
                            secret_key_ref {
                                name = "mysql-secret"
                                key = "password"
                            }
                        }
                    }
                    env {
                        name    = "MYSQL_DATABASE"
                        value   = var.mysqldb
                    }
                    env {
                        name    = "MYSQL_USER"
                        value   = var.mysqluser
                    }
                    env {
                        name    = "MYSQL_PASSWORD"
                        value   = var.mysqluserpass
                    }

                    port {
                        container_port = var.port

                    }

                    volume_mount {
                        mount_path  = "/docker-entrypoint-initdb.d"
                        name        = "create-table-config-map"
                    }
                }

                volume {
                    name = "create-table-config-map"
                    config_map {
                        name = "create-table-config-map"
                    }
                    

                }
            }
        }
    }

}

resource "kubernetes_service" "mysql" {
    metadata {
        name = var.name
    }

    spec {
        selector = {
            app = var.name
        }
        port {
            protocol = var.portprotocol
            port = var.port
            target_port = var.port
        }
    }
}
 
resource "kubernetes_config_map" "create-table-config-map" {
    metadata {
        name = "create-table-config-map"
    }

    data = {
        "${var.createsql}" = file("./modules/mysql/userdata/${var.createsql}")
    }
}

resource "kubernetes_secret" "mysql-secret" {
    metadata {
        name = "mysql-secret"
    }
    data = {
        password = var.mysqlrootpass
    }
}