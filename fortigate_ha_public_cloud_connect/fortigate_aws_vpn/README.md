## Project Overview
This project aims to establish a secure VPN connection between a Fortigate HA firewall and AWS Cloud. It utilizes Terraform for infrastructure as code and Python for automation.

## Instructions to Run

1. **Install Requirements:**
   - Install Terraform on your machine.
   - Install Python 3.x.
   - Install required Python packages listed in `requirements.txt`.

2. **Set Up the Workspace:**
   - Navigate to the `src/terraform` directory.
   - Update `terraform.tfvars` with your specific configuration values, including VPN settings and AWS region.

3. **Run the Python Script:**
   - Navigate to the `src/scripts` directory.
   - Execute the Python script to run Terraform:
     ```
     python3 run_terraform.py
     ```

4. **Verify Configuration:**
   - Check the outputs defined in `outputs.tf` for the VPN connection ID and public IP addresses.
   - Ensure the VPN connection is established and functioning as expected.

## Project Structure
- **src/terraform/**: Contains all Terraform configuration files.
- **src/scripts/**: Contains the Python script for automating Terraform commands.
- **src/configs/**: Contains configuration files for the VPN setup.
- **.gitignore**: Specifies files to be ignored by Git.
- **README.md**: Documentation for the project.
- **requirements.txt**: Lists Python dependencies required for the project.

This setup provides a comprehensive guide to deploying a VPN connection between your Fortigate HA firewall and AWS Cloud, ensuring secure communication between your on-premises infrastructure and cloud resources.