output "role_name" {
  description = "Name of the created role"
  value       = join("", aws_iam_role.default.*.name)
}

output "role_arn" {
  description = "ARN of the created role"
  value       = join("", aws_iam_role.default.*.arn)
}
