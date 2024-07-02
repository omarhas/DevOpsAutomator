## Table of Contents  <!-- omit in toc -->

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)


## Introduction <a name="introduction"></a>
This playbook is used to automate Docker installation 


## Installation <a name="installation"></a>
Installation
To set up Ansible on your machine, follow these steps:

Installation Guide:  https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Verify Installation: Once Ansible is installed, verify its installation by running the following command in your terminal:

ansible --version

Download the Playbook: After confirming Ansible is installed, download the playbook to proceed with your automation tasks.

By following these steps, you'll have Ansible set up on your machine, ready to automate your tasks efficiently.





## Usage <a name="usage"></a>

### Installing Docker with Ansible
Prerequisites:

Before proceeding, ensure you have:

sudo (temporary admin access) permissions to install software on the target machine.

Steps

1- Update Ansible Configuration:

Open the repo_root/runner-setup/ansible-automation/ansible.cfg file and replace the remote_user value with your username.

Configure Playbook:

Navigate to repo_root/runner-setup/ansible-automation/main.yaml and add the install-docker role under the roles section then save your changes and exit.

2- Execute the Playbook:

cd to repo_root/runner-setup/ansible-automation and run the playbook using the following command:

ansible-playbook main.yaml

Then it will prompt you for your password, and you must enter it.
