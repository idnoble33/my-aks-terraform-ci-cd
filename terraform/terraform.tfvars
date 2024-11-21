# VM and Resource Group Configuration
vm_name              = "my-vm"                          # Name for the virtual machine
resource_group_name  = "Idowu-Candidate"                # Resource group name
location             = "West Europe"                    # Azure region
vm_size              = "Standard_B1s"                   # VM size (adjust as per your needs)
admin_user           = "azureuser"                      # The admin username for SSH login

# Network Configuration
subnet_id            = "/subscriptions/2fa0e512-f70e-430f-9186-1b06543a848e/resourceGroups/Idowu-Candidate/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"

# SSH Public Key Path
ssh_key_path         = "/Users/noble/.ssh/id_rsa.pub"    # Path to SSH public key

# Subscription and Tenant IDs
subscription_id      = "2fa0e512-f70e-430f-9186-1b06543a848e"  # Subscription ID
tenant_id            = "2fa0e512-f70e-430f-9186-1b06543a848e"    # Tenant ID
