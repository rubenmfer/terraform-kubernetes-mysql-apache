resource "kubernetes_deployment" "phpmyadmin" {
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

                    port {
                        container_port = var.port
                    }
                    env {
                        name    = "PMA_HOST"
                        value   = var.pmahost
                    }
                    env {
                        name    = "PMA_PORT"
                        value   = var.pmaport
                    }
                    env {
                        name    = "MYSQL_ROOT_PASSWORD"
                        value   = var.mysqlrootpass
                    }
                }
            }
        }
    }
}

resource "kubernetes_service" "phpmyadmin" {
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