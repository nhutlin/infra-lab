terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "Infra_Lab" {
  name        = var.repository_name
  description = "Terraform-created repository"
  visibility  = var.visibility

  auto_init           = true  # creates a README.md
  has_issues          = true
  has_wiki            = false
  delete_branch_on_merge = true
}
