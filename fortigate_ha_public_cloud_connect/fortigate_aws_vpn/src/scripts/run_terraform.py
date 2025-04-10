import os
import subprocess

def run_terraform():
    # Change to the terraform directory
    os.chdir(os.path.join(os.path.dirname(__file__), '..', 'terraform'))

    # Initialize Terraform
    subprocess.run(['terraform', 'init'], check=True)

    # Apply the Terraform configuration
    subprocess.run(['terraform', 'apply', '-auto-approve'], check=True)

if __name__ == "__main__":
    run_terraform()