import json
import subprocess
import os

def load_variables(json_file):
    with open(json_file) as f:
        return json.load(f)

def run_terraform(variables):
    subprocess.run(["terraform", "init"], check=True)
    subprocess.run(["terraform", "apply", "-auto-approve"], check=True, env=variables)

if __name__ == "__main__":
    json_file = os.path.join(os.path.dirname(__file__), 'config', 'variables.json')
    variables = load_variables(json_file)
    run_terraform(variables)