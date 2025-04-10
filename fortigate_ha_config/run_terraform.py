import subprocess

def run_terraform():
    try:
        # Initialize Terraform
        subprocess.run(["terraform", "init"], check=True, cwd="../terraform")
        
        # Plan the Terraform deployment
        subprocess.run(["terraform", "plan"], check=True, cwd="../terraform")
        
        # Apply the Terraform configuration
        subprocess.run(["terraform", "apply", "-auto-approve"], check=True, cwd="../terraform")
        
        print("Terraform applied successfully.")
    except subprocess.CalledProcessError as e:
        print(f"An error occurred while running Terraform: {e}")

if __name__ == "__main__":
    run_terraform()