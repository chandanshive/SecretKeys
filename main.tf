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

data "azurerm_key_vault" "terrakv" {
  name                = "terrakv" // KeyVault name
  resource_group_name = "mykv" // resourceGroup
}

data "azurerm_key_vault_secret" "kvsecret" {
name = "secret" // Name of secret
key_vault_id = data.azurerm_key_vault.terrakv.id
}

os_profile {
computer_name  = "vm-01"
admin_username = "testadmin"
admin_password = data.azurerm_key_vault_secret.kvsecret.value // Toget actual value
}
