# User Documentation

  - ## Services Overview

	This project deploys a small web infrastructure composed of the following services:

	- **NGINX:** Acts as a web server and reverse proxy, handling HTTPS connections and routing requests to the appropriate services.
	- **WordPress:** A content management system (CMS) that provides the website and allows content administration through a web interface.
	- **MariaDB:** A relational database used to store WordPress data such as users, posts, and configuration.

 - ## Execution
	 For this project, it will not be cloned in the usual way we are accustomed to at 42, since it will be executed inside a virtual machine. Therefore, we must follow these steps:

	- First, clone the repository in the usual way from the intra using the git clone command.
		- `git clone <proyect ssh> <folders name>`

	- Next, transfer the project directory to the virtual machine. This can be done in several ways, for example:

	- Connecting to the virtual machine via SSH and sending the files over SSH.

	- Using a shared folder between the virtual machine and the host.

	- Enabling copy-paste or drag-and-drop in the virtual machine settings.

	- In this case, we will use the last option and drag the project directory to the desktop of the virtual machine.

	As a security measure, the `secrets` folder and the `.env` file have not been uploaded since they contain sensitive data.
	- Place the `secrets` folder at the same level as the `Makefile`. 
	- Place `.env` file inside the `src` folder.

	Finally, from the terminal, run `make up` (or `make` as an alternative) to start the program.
	## Web Access

	Once the system is up and running, the website will be available and can be accessed through a web browser using **HTTPS with SSL**:

	- Via `https://localhost`
	- Via `https://<login>.42.fr`, in this case: `https://pablalva.42.fr`

	- To access the website as an administrator, go to:
	`https://pablalva.42.fr/wp-admin`  
	and log in using the administrator credentials to access the WordPress administration panel.

	- If an attempt is made to connect using **HTTP** instead of **HTTPS**, an error will occur, as insecure connections through port **80** are disabled. Only secure **HTTPS (SSL)** connections are allowed.

	## Credentials Management

	Sensitive information such as database credentials and WordPress user passwords are not stored directly in the repository.

	- Environment variables are defined in the `.env` file, located inside the `src` directory.
	- Sensitive data (such as database passwords) is stored in the `secrets` directory, located at the same level as the Makefile.

	To modify credentials:
	1. Edit the corresponding value in the `.env` file or the appropriate file inside the `secrets` directory.
	2. Restart the project to apply the changes:
	```bash
	make down
	make up
	```
	## Service Status Verification

	To check that the services are running correctly, use the following command:

	```bash
	docker ps