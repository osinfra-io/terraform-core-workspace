# Terraform Output Values
# https://www.terraform.io/language/values/outputs

output "env" {
  description = "The short name for the environment for example prod, nonprod, sb"
  value       = local.env
}

output "environment" {
  description = "The environment name for example production, non-production, sandbox"
  value       = local.environment
}

output "labels" {
  description = "A map of labels to apply to resources"
  value       = local.labels
}

output "region" {
  description = "The region where resources will be deployed"
  value       = local.region
}

output "zone" {
  description = "The zone where resources will be deployed"
  value       = local.zone
}
