#!/bin/bash

# This script checks for the presence of the 'ansible-galaxy' command
# and, if found, proceeds to install a list of specified Ansible collections and roles.

# --- Configuration ---
# Define the Ansible collections to install (format: namespace.collection_name)
ANSIBLE_COLLECTIONS=(
  "community.general"
  "ansible.posix"
  "kewlfft.aur"
)

# Define the Ansible roles to install (format: role_name or github_user.role_name)
ANSIBLE_ROLES=(
)
# --- End Configuration ---

echo "--- Starting Ansible Galaxy Installation Script ---"

# 1. Check if ansible-galaxy command is available
echo "Checking for 'ansible-galaxy' command..."
if command -v ansible-galaxy &>/dev/null; then
  echo "'ansible-galaxy' command found. Proceeding with installations."

  # 2. Install Ansible Collections
  echo ""
  echo "--- Installing Ansible Collections ---"
  for collection in "${ANSIBLE_COLLECTIONS[@]}"; do
    echo "Attempting to install collection: $collection"
    ansible-galaxy collection install "$collection"
    if [ $? -eq 0 ]; then
      echo "Successfully installed collection: $collection"
    else
      echo "WARNING: Failed to install collection: $collection. Please check the error above."
    fi
    echo "-------------------------------------"
  done

  # 3. Install Ansible Roles
  echo ""
  echo "--- Installing Ansible Roles ---"
  for role in "${ANSIBLE_ROLES[@]}"; do
    echo "Attempting to install role: $role"
    ansible-galaxy role install "$role"
    if [ $? -eq 0 ]; then
      echo "Successfully installed role: $role"
    else
      echo "WARNING: Failed to install role: $role. Please check the error above."
    fi
    echo "-------------------------------------"
  done

  echo ""
  echo "--- Ansible Galaxy Installation Script Finished ---"
  echo "Please review the output for any warnings or errors during installation."

else
  echo "'ansible-galaxy' command not found."
  echo "Please ensure Ansible is installed and 'ansible-galaxy' is in your system's PATH."
  echo "You can usually install Ansible via your system's package manager (e.g., 'sudo apt install ansible' on Debian/Ubuntu, 'sudo yum install ansible' on CentOS/RHEL)."
  echo "--- Script Aborted ---"
  exit 1 # Exit with an error code
fi
