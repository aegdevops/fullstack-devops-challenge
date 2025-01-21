output "react_app_s3_arn" {
  value       = aws_s3_bucket.react_app.arn
  description = "S3 bucket ARN"
}
