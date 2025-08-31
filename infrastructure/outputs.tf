output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.cdn.domain_name
  description = "Public URL of your secure site"
}

output "s3_bucket" {
  value = aws_s3_bucket.site.id
}