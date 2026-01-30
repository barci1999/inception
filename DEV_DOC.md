# Developer Documentation

## Environment Setup

This project is designed to be set up and executed inside a **Xubuntu virtual machine**.

### Prerequisites
- Docker
- Docker Compose
- Make

### Configuration Files and Secrets

Sensitive data is not included in the repository and must be added manually.

- **`.env`**  
  Contains environment variables used by the services.  
  Location: `src/.env`

- **`secrets/`**  
  Contains sensitive information such as database passwords.  
  Location: at the same level as the Makefile

These files are required to correctly build and run the project.

---

## Build and Launch

The project is managed using a **Makefile**, which wraps Docker Compose commands.

- Build and start the project:
  ```bash
  make up
  ```
- Stop the project and remove containers:
  ```bash
  make down
  ```
- Default rule to build and launch:
  ```bash
  make
  ```

Docker Compose is used to build images, create containers, networks, and volumes.

---

## Container and Volume Management

The following Docker commands are useful for managing the project:

- List running containers:
  ```bash
  docker ps
  ```
- List all containers:
  ```bash
  docker ps -a
  ```
- View logs of a container:
  ```bash
  docker logs <container_name>
  ```
- List Docker volumes:
  ```bash
  docker volume ls
  ```
- Inspect a Docker volume:
  ```bash
  docker volume inspect <volume_name>
  ```

To stop the project and remove containers, networks, and volumes:
```bash
docker compose down -v
```

---

## Data Storage and Persistence

Project data is stored using **Docker volumes** to ensure persistence.

- The MariaDB service stores its database files in a dedicated volume.
- The WordPress service stores its files and uploads in a separate volume.
- Docker volumes persist even if containers are stopped or removed.

Persistent data is only deleted when volumes are explicitly removed.