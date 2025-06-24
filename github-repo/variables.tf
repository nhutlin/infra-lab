variable "github_token" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "github_owner" {
  description = "GitHub username or organization"
  type        = string
}

variable "repository_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "visibility" {
  description = "Repository visibility: public or private"
  type        = string
  default     = "private"
}
