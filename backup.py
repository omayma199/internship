import os
import docker
import io
def backup_file_in_containers(backup_path, source_file_path_inside_container):
    client = docker.from_env()

    for container in client.containers.list():
        container_name = container.name
        print("{} - ".format(container_name), end="")


        # Create a directory for each container in the backup path
        container_backup_dir = os.path.join(backup_path, container_name)
        os.makedirs(container_backup_dir, exist_ok=True)

        # Use 'docker cp' to copy the file from the container to the host machine
        destination_path_on_host = os.path.join(container_backup_dir, os.path.basename(source_file_path_inside_container))
        try:
            with open(destination_path_on_host, "wb") as f:
                # Get the generator data from the container and convert it to bytes
                data_generator, stat = container.get_archive(source_file_path_inside_container)
                data_bytes = b''.join(data for data in data_generator)

                # Write the bytes to the file
                f.write(data_bytes)
                
            print("OK")
        except docker.errors.NotFound:
            print("File not found in the container")

if __name__ == "__main__":
    backup_path = "/Users/oumaima/Desktop/backup_dir"
    source_file_path_inside_container = "/home/jovyan"

    backup_file_in_containers(backup_path, source_file_path_inside_container)