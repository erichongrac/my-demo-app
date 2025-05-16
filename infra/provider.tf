# GitHub provider config
provider "github" {
  token = var.github_token != "" ? var.github_token : getenv("GH_TOKEN")
  owner = var.github_owner != "" ? var.github_owner : getenv("GH_OWNER")
}
