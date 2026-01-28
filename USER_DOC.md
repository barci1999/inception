# User Documentation
 - ## Services
	- ### MariaDb:
	- ### WordPress:
	- ### Nginx:
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
 - ## Web Access
	-
 - ## Proyect status
	-