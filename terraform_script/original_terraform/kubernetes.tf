//CREATE DEPLOYMENT - provide rds environment variables
resource "kubernetes_deployment" "moodle" {
  depends_on = [aws_db_instance.rds]
  metadata {
    name = "moodle"
    labels = {
      App = "moodle"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "moodle"
      }
    }
    template {
      metadata {
        labels = {
          App = "moodle"
        }
      }
      spec {
        container {
          image = "bitnami/moodle:latest"
          name  = "moodle"
          command = ["sh", "-c" , "/opt/bitnami/scripts/moodle/entrypoint.sh /opt/bitnami/scripts/moodle/run.sh && /opt/bitnami/scripts/moodle/run.sh "]
          args = ["/opt/bitnami/scripts/moodle/run.sh"]
          env{
            name = "MOODLE_DATABASE_HOST"
            value = "${aws_db_instance.rds.address}"
          }
          env{
            name = "MOODLE_DATABASE_TYPE"
            value = "mariadb"
          }
          env{
            name = "MOODLE_DATABASE_PORT"
            value = "${aws_db_instance.rds.port}"
          }
          env{
            name = "MOODLE_DATABASE_USER"
            value = "${aws_db_instance.rds.username}"
          }
          env{
            name = "MOODLE_DATABASE_PASSWORD"
             value = "${aws_db_instance.rds.password}"
          }
          env{
            name = "MOODLE_DATABASE_NAME"
            value = "${aws_db_instance.rds.db_name}"
          }
          env{
            name = "PHP_MAX_INPUT_VARS"
            value = "8000"
          }
          env{
            name = "MOODLE_SSLPROXY"
            value = "true"
          }
          port {
            container_port = 8080
            name = "tcp"
          }
          port {
            container_port = 8443
            name = "ssll"
          }
          volume_mount {
            name = "moodle-ps"
            mount_path = "/bitnami/moodle/"
          }
          resources {
            limits= {
              cpu    = "0.5"
              memory = "1024Mi"
            }
            requests= {
              cpu    = "250m"
              memory = "512Mi"
            }
          }
        }
      volume {
        name = "moodle-ps"
        persistent_volume_claim {
          claim_name = var.pvc_name
        }
      }
      }
    }

  }
}


//EXPOSE DEPLOYMENT - This creates a LoadBalancer, which routes traffic from //the external load balancer to pods with the matching selector.

resource "kubernetes_service" "moodle" {
  depends_on = [kubernetes_deployment.moodle]
  metadata {
    name = "moodle"
  }
  spec {
    selector = {
      App = kubernetes_deployment.moodle.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
      name="tcp"
    }
    port {
      port=443
      target_port=8443
      name="ssl"
   }

    type = "LoadBalancer"
  }
}

resource "kubernetes_storage_class" "kubeSC" {
  metadata {
    name = "kubese"
  }
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy = "Retain"
  parameters = {
    type = "gp2"
  }
}

resource "kubernetes_persistent_volume_claim" "pvc" {
  depends_on=[kubernetes_storage_class.kubeSC]
  metadata {
    name = var.pvc_name
    labels = {
      "app" = "moodle"
    }
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}