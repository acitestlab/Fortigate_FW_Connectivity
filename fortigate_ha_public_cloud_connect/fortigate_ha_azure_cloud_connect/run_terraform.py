import subprocess

def run_terraform(directory):
    try:
        # Initialize Terraform
        subprocess.run(["terraform", "init"], check=True, cwd=directory)
        
        # Plan the Terraform deployment
        subprocess.run(["terraform", "plan"], check=True, cwd=directory)
        
        # Apply the Terraform configuration
        subprocess.run(["terraform", "apply", "-auto-approve"], check=True, cwd=directory)
        
        print(f"Terraform applied successfully in {directory}.")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while running Terraform in {directory}: {e}")

if __name__ == "__main__":
    run_terraform("./fortigate")
    run_terraform("./azure")