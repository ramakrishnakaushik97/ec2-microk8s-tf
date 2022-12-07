output "aws_resource_public_dns" {
  value       = aws_instance.mediawiki_instance.public_ip
  description = "public IP of the mediawiki instance"
}