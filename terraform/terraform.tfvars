# VM and Resource Group Configuration
vm_name              = "my-vm"                          # Name for the virtual machine
resource_group_name  = "Idowu-Candidate"                # Resource group name
location             = "West Europe"                    # Azure region
vm_size              = "Standard_B1s"                   # VM size (adjust as per your needs)
admin_user           = "azureuser"                      # The admin username for SSH login

# Network Configuration
subnet_id            = "/subscriptions/<subscription_id>/resourceGroups/Idowu-Candidate/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"

# SSH Public Key Path
ssh_key_path         = "/Users/noble/.ssh/id_rsa.pub" 

# Subscription and Tenant IDs
subscription_id      = "<subscription_id"  # Subscription ID
tenant_id            = "tenant_id"    # Tenant ID
