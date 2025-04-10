# Fortigate HA to AWS VPN Configuration

This project sets up a VPN connection between a Fortigate HA firewall and AWS Cloud using Terraform.

## Instructions to Run

1. **Install Requirements**:
   - Install Terraform on your machine.
   - Install Python 3.x.

2. **Set Up the Workspace**:
   - Navigate to the `terraform` directory.
   - Update `terraform.tfvars` with your specific configuration values.

3. **Run the Python Script**:
   - Navigate to the `scripts` directory.
   - Execute the Python script to run Terraform:
     ```bash
     python3 run_terraform.py
     ```

4. **Verify Configuration**:
   - Check the AWS Management Console for the VPN Gateway and connection status.
   - Verify the VPN connection on the Fortigate firewall.

## Files
- `main.tf`: Defines the AWS resources.
- `variables.tf`: Contains variable definitions.
- `terraform.tfvars`: Stores variable values.
- `run_terraform.py`: Automates Terraform commands.
- `vpn_config.json`: Stores Fortigate-specific configuration.