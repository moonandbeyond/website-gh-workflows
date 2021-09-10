terraform {
  required_version = "~> 1.0.5"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "moonandbeyond"

    workspaces {
      name = "moonandbeyond-website-gh-workflow"
    }
  }
}
