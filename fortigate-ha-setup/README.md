# Fortigate HA Setup

This project provides a Terraform configuration for setting up a Physical Fortigate High Availability (HA) firewall. The configuration is designed to be customizable and does not include any AWS or Azure resources.

## Project Structure

```
fortigate-ha-setup
├── terraform
│   ├── main.tf            # Main Terraform configuration for Fortigate HA
│   ├── variables.tf       # Variable declarations for customization
│   ├── terraform.tfvars    # Variable values for the configuration
│   └── outputs.tf         # Outputs of the Terraform configuration
├── scripts
│   └── run_terraform.py    # Python script to execute Terraform commands
└── README.md              # Project documentation
```

## Requirements

- Terraform installed on your machine.
- Python 3.x installed on your machine.
- Necessary permissions to execute Terraform commands.

## Setup Instructions

1. Clone the repository to your local machine.
2. Navigate to the `fortigate-ha-setup/terraform` directory.
3. Update the `variables.tf` and `terraform.tfvars` files with your specific configuration values.
4. Run the Python script to execute the Terraform commands:

   ```bash
   python3 ../scripts/run_terraform.py
   ```

## Usage Guidelines

- Modify the `variables.tf` file to adjust the configuration parameters as needed.
- The `terraform.tfvars` file should contain the specific values for the variables declared in `variables.tf`.
- After running the script, check the outputs defined in `outputs.tf` for relevant information about your Fortigate HA setup.

## Additional Information

For more details on configuring Fortigate firewalls, refer to the official Fortinet documentation.