#!/bin/bash

# Configuration
jupyter_notebook_file="/home/jovyan/oumaima.txt"
backup_dir="/Users/oumaima/Desktop/backup_dir"

# Function to backup the Jupyter notebook file
function backup_jupyter_notebook() {
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local notebook_name=$(basename "${jupyter_notebook_file}")
    local backup_file="${backup_dir}/${notebook_name}_${timestamp}"

    cp "${jupyter_notebook_file}" "${backup_file}"

    echo "Jupyter notebook file backed up to: ${backup_file}"
}

# Main script
backup_jupyter_notebook
