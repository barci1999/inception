___This project has been created as part of the 42 curriculum by pablalva___
# Inception
- ## Description
  - Inception is a project that introduces the fundamentals of containerization and service orchestration using Docker. The goal of the project is to build and deploy a small infrastructure composed of multiple services running in isolated containers.

- ## Instructions
  - According to the project requirements, this project must be set up and executed inside a virtual machine. In this case, a Xubuntu virtual machine was used.

  - Docker and Docker Compose must be installed (if they are not already installed). They can be installed using the following commands:

    ```bash
    sudo apt update
    sudo apt install -y docker.io docker-compose
    sudo systemctl enable docker
    sudo systemctl start docker
  - Additionally, a text editor is required to configure the project files. In this case, the default text editor provided by the operating system was used; however, it is recommended to install a more user-friendly editor such as Visual Studio Code for better readability and ease of configuration.
  
  - How to run the project will be explained in the `USER_DOC.md`.
- ## Resources
  - ### References
    - [Docker Documentation](https://docs.docker.com/)
    - [Docker Compose Documentation](https://docs.docker.com/compose/)
    - [NGINX Documentation](https://nginx.org/en/docs/)
    - [WordPress Documentation](https://wordpress.org/support/)
    - [MariaDB Documentation](https://mariadb.com/kb/en/)
  - ### AI Usage
    - Writing clear and structured README sections (Description, Instructions, Resources).
    - Providing explanations and guidance on Docker and container setup.
    - Suggesting best practices for formatting and clarity in the documentation.
- ## Proyect description
    - ### Virtual Machine vs Docker.
      - **Vitual machine:** A virtual machine runs a full operating system with dedicated resources, providing complete isolation.
      - **Docker:** Docker runs lightweight containers that share the host OS, making deployment faster and more efficient.
  - ### Secrets vs Environment Variables.
    - **Secrets:** Sensitive data (like passwords or keys) stored securely and accessed only by the services that need them.
    - **Environment Variables:** Store configuration values that can be easily accessed by applications, but are generally less secure than secrets.
  - ### Docker Network vs Host Network.
    - **Docker Network:** Creates an isolated virtual network for containers, allowing them to communicate with each other securely while controlling which ports are exposed to the host.
    - **Host Network:** Makes a container share the host machine’s network stack, giving the container direct access to the host’s IP addresses and ports, but with less isolation.
  - ### Docker Volumes vs Bind Mounts.
    - **Docker Volumes:** Volumes are managed by Docker and stored in Docker’s directory. They are ideal for persistent data, can be easily backed up, and are portable between containers.
    - **Bind Mounts:** Bind mounts map a directory or file from the host directly into a container. They provide full access to the host filesystem but offer less portability and isolation.