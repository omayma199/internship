#!/bin/bash
backup_path="$HOME/Users/oumaima/Desktop"

for container_id in $(docker ps -q)
do
    container_name=$(docker inspect --format='{{.Name}}' "$container_id" | cut -f2 -d '/')
    echo -n "$container_name - "
    mkdir -p "$backup_path/$container_name"

    # Replace "path/to/your/source_file.txt" with the path to the file inside the container
    source_file_path_inside_container="$HOME/jovyan/oumaima.txt"

    # Use 'docker cp' to copy the file from the container to the host machine
    docker cp "$container_id:$source_file_path_inside_container" "$backup_path/$container_name/"

    echo "OK"
done