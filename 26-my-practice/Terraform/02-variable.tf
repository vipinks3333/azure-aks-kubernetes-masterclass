variable "location" {
    type = string
    description = "location"
    default = "central us"
}

variable "resource_group_name" {
  type = string
  description = "rg name"
  default = "aks-rg-dev"
}

# V2 Changes
# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "/Users/tincyvipin/ssh-keys-teerraform-aks-devops/aks-terraform-devops-ssh-key-ububtu.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"  
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "P@ssw0rd123412344321"
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}

variable "environment" {
    type = string
    default = "Dev"
}