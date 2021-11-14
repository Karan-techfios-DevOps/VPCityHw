output "public_ip_WebServer" {
  value = aws_instance.WebServer.public_ip
}

output "public_ip_AppSerever" {
  value = aws_instance.AppServer.public_ip
}