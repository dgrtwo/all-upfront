terraform {
  required_version = ">= 1.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
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
