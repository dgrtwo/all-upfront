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
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
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

# Enable "Allow GitHub Actions to create and approve pull requests"
# This setting is required for claude-code-action to create PRs
resource "null_resource" "enable_actions_pr_permissions" {
  provisioner "local-exec" {
    command = <<-EOT
      curl -s -X PUT \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github+json" \
        https://api.github.com/repos/dgrtwo/all-upfront/actions/permissions/workflow \
        -d '{"default_workflow_permissions":"write","can_approve_pull_request_reviews":true}'
    EOT
  }

  depends_on = [github_actions_repository_permissions.all_upfront]
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
