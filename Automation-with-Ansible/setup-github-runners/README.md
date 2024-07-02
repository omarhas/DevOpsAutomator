## Table of Contents  <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)


## Introduction <a name="introduction"></a>
This playbook is used to automate setup github runners  


## Installation <a name="installation"></a>
Installation
To set up Ansible on your machine, follow these steps:

Installation Guide:  https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Verify Installation: Once Ansible is installed, verify its installation by running the following command in your terminal:

ansible --version

Download the Playbook: After confirming Ansible is installed, download the playbook to proceed with your automation tasks.

By following these steps, you'll have Ansible set up on your machine, ready to automate your tasks efficiently.

## Usage <a name="usage"></a>

### Setting Up GitHub Runners as a Service
Prerequisites:

Before proceeding, ensure you have:

Ansible installed on your system.

Access to the repository where you want to set up GitHub Runners. or admin access to the org if you want to setup org level runners

Steps
1- Update Ansible Configuration:

In the ansible.cfg file, replace the remote_user value with your own username.

1- Configure Playbook:

Open  repo_root/Automation-with-Ansible/main.yaml and add the setup-github-runners role under the roles section.

2- Configure Runner Settings:

Navigate to  repo_root/Automation-with-Ansible/setup-github-runners/vars/main.yml and customize the following variables:

url: Replace with your GitHub repository URL.

token: Replace with your GitHub access token.

runner_name: Optionally, set a specific name for your runner.

custom_labels: Optionally, specify custom tags for your runner. supported tags are listed here https://inside-docupedia.bosch.com/confluence/x/ax_S-/

daemon_setup: Set to false if you don't want to set up runners as a service.

3- Run the Playbook:

Save your modifications and cd to repo_root/runner-setup/ansible-automation then execute the playbook using the following command:

ansible-playbook main.yaml

Then it will prompt you for your password, and you must enter it.

Alternatively, you can pass variables as arguments:

ansible-playbook -e "url=<your_url>" -e "token=<your_token>" -e "runner_name=<runner_name>" -e "labels=<tags1,tags2>"
Replace <your_url>, <your_token>, <runner_name>, and <tags1,tags2> with your specific values.
