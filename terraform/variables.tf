variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token with Pages permissions"
  sensitive   = true
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare account ID"
}
