resource "kubernetes_secret" "example" {
  metadata {
    name = "basic-auth"
  }

  data = {
    username = "admin"
    password = "P4ssw0rd"
  }

  type = "kubernetes.io/basic-auth"
}

resource "vault_aws_secret_backend" "aws" {
  access_key = "AKIA....."
  secret_key = "SECRETKEYFROMAWS"
}

# azure code

terraform {
  backend "azurerm" {
    storage_account_name = "abcd1234"
    key                  = "abc9923xyz"

    # rather than defining this inline, the Access Key can also be sourced
    # from an Environment Variable - more information is available below.
    access_key = "abcdefghijklmnopqrstuvwxyz0123456789..."
  }
}
