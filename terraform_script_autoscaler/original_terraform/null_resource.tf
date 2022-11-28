resource "null_resource" "example2" {
  provisioner "local-exec" {
    depends_on =[]
    command = "chmod +x start_autoscaler.sh && ./start_autoscaler.sh"
  }
}
