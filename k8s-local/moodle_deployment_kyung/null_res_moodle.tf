resource "null_resource" "null1" {
  depends_on = [aws_db_instance.rds]
  provisioner "local-exec" {
    command = "kubectl apply -f moodle-deployment.yaml"
  }
}