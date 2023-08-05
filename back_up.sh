#!/bin/bash

# Variables
CONTAINER_NAME="internship"
SOURCE_PATH="/Users/oumaima/.docker/devenvironments/internship/repository"  
LOCAL_BACKUP_DIR="/Users/oumaima/Desktop/backup_dir" 
REMOTE_REPO_URL="https://github.com/omayma199/internship"  

# Copy the file from the container to the local machine
docker cp "$CONTAINER_NAME:$SOURCE_PATH" "$LOCAL_BACKUP_DIR"

# Initialize a Git repository and commit the file
cd "$LOCAL_BACKUP_DIR"
git init
git add .
git commit -m "Backup file from container"

# Push the file to the remote repository
git remote add origin "$REMOTE_REPO_URL"
git push -u origin master

# Cleanup
rm -rf "$LOCAL_BACKUP_DIR"

echo "Backup and push completed successfully!"