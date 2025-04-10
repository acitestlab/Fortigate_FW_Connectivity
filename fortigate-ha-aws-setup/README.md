# Fortigate HA Firewall Setup

This project provides a Terraform configuration and a Python script to set up a Fortigate High Availability (HA) firewall.

## Project Structure

```
fortigate-ha-setup
├── terraform
│   ├── main.tf          # Main Terraform configuration for Fortigate HA setup
│   ├── variables.tf     # Input variables for Terraform configuration
│   ├── outputs.tf       # Output values from Terraform execution
│   └── terraform.tfvars  # Variable values for the deployment
├── scripts
│   ├── run_terraform.py  # Python script to execute Terraform commands
│   └── config
│       └── variables.json # Configuration variables in JSON format
├── requirements.txt      # Python dependencies for the project
└── README.md             # Project documentation
```

## Prerequisites

- Terraform installed on your machine.
- Python 3.x installed on your machine.
- Required Python libraries listed in `requirements.txt`.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   cd fortigate-ha-setup
   ```

2. Navigate to the `terraform` directory and customize the `terraform.tfvars` file with your specific configuration values.

3. Install the required Python libraries:
   ```
   pip install -r requirements.txt
   ```

4. Run the Python script to execute the Terraform commands:
   ```
   python scripts/run_terraform.py
   ```

## Usage

- Modify the `variables.json` file in the `scripts/config` directory to set the necessary variables for your Fortigate HA setup.
- The Python script will read these variables and pass them to Terraform during execution.

## Outputs

After running the Terraform script, the output values defined in `outputs.tf` will be displayed, providing information about the deployed resources.

## License

This project is licensed under the MIT License.