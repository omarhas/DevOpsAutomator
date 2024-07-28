# Installation Script for Docker, Kubectl, and Minikube

This script automates the installation of Docker, kubectl, and Minikube on Ubuntu. It supports both x86_64 and aarch64 architectures.

## Features

- Installs Docker and its dependencies.
- Installs kubectl and Minikube.
- Automatically detects the system architecture and installs the appropriate versions of kubectl and Minikube.
- Adds the current user to the Docker group for non-root Docker usage.

## Prerequisites

- Ubuntu operating system.
- `sudo` privileges.

## Usage

1. Download the script .

2. Make the script executable:

    ```bash
    chmod +x setup-minikube.sh
    ```

3. Run the script:

    ```bash
    ./setup-minikube.sh
    ```

