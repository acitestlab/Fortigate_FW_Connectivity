import os
import subprocess

def run_terraform():
    terraform_dir = os.path.join(os.path.dirname(__file__), "../terraform")
    subprocess.run(["terraform", "init"], cwd=terraform_dir, check=True)
    subprocess.run(["terraform", "apply", "-auto-approve"], cwd=terraform_dir, check=True)

if __name__ == "__main__":
    run_terraform()