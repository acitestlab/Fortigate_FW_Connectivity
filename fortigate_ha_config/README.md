Here’s how you can configure a Fortigate HA firewall with a virtual context firewall using Terraform and Python. This includes creating three interfaces (dmz, internal, and external), assigning IP addresses, configuring OSPF, and setting up a static route to the WAN router.

Instructions to Run
    1.  Install Requirements:
            Install Terraform on your machine.
            Install Python 3.x.
    2.  Set Up the Workspace:
            Navigate to the terraform directory.
            Update terraform.tfvars with your specific configuration values.
    3.  Run the Python Script:
            Navigate to the scripts directory.
            Execute the Python script to run Terraform:

            python3 run_terraform.py

    4.  Verify Configuration:
            Check the outputs defined in outputs.tf for the configured interface IPs.

This setup configures a Fortigate HA firewall with virtual context, assigns IPs to the dmz, internal, and external interfaces, configures OSPF, and sets up a static route to the WAN router.