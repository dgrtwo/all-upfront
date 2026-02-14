terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "github" {
  owner = "dgrtwo"
  # Uses GITHUB_TOKEN env var for auth
}

# GitHub Actions secret for Claude Code
resource "github_actions_secret" "anthropic_api_key" {
  repository      = "all-upfront"
  secret_name     = "ANTHROPIC_API_KEY"
  plaintext_value = var.anthropic_api_token
}

# Ensure Actions has write permissions for the Claude bot
resource "github_actions_repository_permissions" "all_upfront" {
  repository      = "all-upfront"
  enabled         = true
  allowed_actions = "all"
}

resource "cloudflare_pages_project" "all_upfront" {
  account_id        = var.cloudflare_account_id
  name              = "all-upfront"
  production_branch = "main"

  source {
    type = "github"
    config {
      owner                         = "dgrtwo"
      repo_name                     = "all-upfront"
      production_branch             = "main"
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }

  build_config {
    build_command   = "npm run build"
    destination_dir = "dist"
  }
}

output "pages_url" {
  value       = cloudflare_pages_project.all_upfront.subdomain
  description = "The *.pages.dev subdomain for the project"
}
