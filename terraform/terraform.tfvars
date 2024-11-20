# VM and Resource Group Configuration
vm_name              = "my-vm"                          # Name for the virtual machine
resource_group_name  = "Idowu-Candidate"              # Resource group name
location             = "West Europe"                        # Azure region
vm_size              = "Standard_B1s"                  # VM size (adjust as per your needs)
admin_user           = "azureuser"                      # The admin username for SSH login

# Network Configuration
subnet_id            = "/subscriptions/27c83813-916e-49fa-8d2a-d35332fc8ca4/resourceGroups/my-resource-group/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet"  # Example subnet ID

# SSH Public Key Path
subscription_id = "27c83813-916e-49fa-8d2a-d35332fc8ca4"
ssh_key_path = "/Users/noble/.ssh/id_rsa.pub"
tenant_id = "27c83813-916e-49fa-8d2a-d35332fc8ca4"
