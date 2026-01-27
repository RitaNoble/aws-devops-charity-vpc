output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "Public IP of the web server"
}

output "website_url" {
  value       = "http://${aws_instance.web.public_ip}"
  description = "Website URL"
}
