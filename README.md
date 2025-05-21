# Ansible Desktop setup

This project contains Ansible roles and playbooks to help set up a personalized desktop environment on Arch Linux and Fedora distributions.

## Prerequisites

Ensure Ansible is installed on your system. You will also need to install the required Ansible collections by running:

```bash
ansible-galaxy install -r requirements.yml
```

## Usage

The main playbook is `local.yml`. By default, it is configured to set up an Arch Linux environment.

### For Arch Linux

To run the playbook for Arch Linux (default):

```bash
ansible-playbook local.yml
```

### For Fedora

To run the playbook specifically for a Fedora environment, you need to pass the `distro` variable with the value `fedora`:

```bash
ansible-playbook local.yml -e "distro=fedora"
```

This will apply the Fedora-specific configurations.

## Customization

You can customize the lists of packages and Flatpak applications installed by each role:

*   **Fedora**: Edit `roles/fedora/vars/main.yml` to change the `fedora_packages` and `fedora_flatpaks` lists.
*   **Arch Linux**: Edit `roles/arch/vars/main.yml` to change the `arch_packages`, `arch_aur_packages`, and `arch_flatpaks` lists.

Users can edit these files to add or remove packages according to their needs.
