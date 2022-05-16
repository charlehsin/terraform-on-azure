# Set up WSL2 with Ubuntu on virtual machine running Windows 11

**_NOTE: WSL2 is not supported on Windows Server 2019 or 2022 yet. We cannot use Docker Engine on WSL1. Check [WSL2 Support for Windows Server 2019
](https://github.com/MicrosoftDocs/WSL/issues/678) and [WSL 2 broken on Windows Server Preview](https://github.com/microsoft/WSL/issues/6301 ) for more details._**

We will create a [managed image](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/capture-image-resource). This is using the Windows 11 image, and then we do the following in order.

1. Set up WSL2 with Ubuntu. Since we cannot enter first user and password, in order to achieve unattended installation, all the setup on Ubuntu will be at root user.
2. Upload our target files. It includes a setup.bat for the user to install Ubuntu and Docker on Ubuntu later.
3. Install IIS.
4. Download Visual Studio Code installer.
5. Download SQL Server installer.
6. Download SQL Server Management Studio installer.

We did the authentication via Azure CLI as described by [Azure CLI](https://www.packer.io/plugins/builders/azure#azure-cli). We follow

1. [File Provisioner](https://www.packer.io/docs/provisioners/file)
2. [PowerShell Provisioner](https://www.packer.io/docs/provisioners/powershell)

Open a Bash.

1. If you are behind corporate VPN, run "export HTTPS_PROXY=<proxy_https>" and "export HTTP_PROXY=<proxy_http>".
2. Run "az account set --subscription <subscription_id_or_subscription_name>" to set correct subscription, and then "az account show" to find the tenant ID.
3. Update input.pkrvars.hcl file.
4. Run "packer init ."
5. Run "packer fmt ."
6. Run "packer validate ."
7. Run "packer build --var-file=inputs.pkrvars.hcl ."
   - This may take a while.
   - If the provisioner is stuck, press Ctrl+C to cancel the build and start the clean-up flow.
8. The created image will be inside the specified resource group. You can see it on your Azure portal.

## Useful commands for Docker

- wsl -u root sudo service docker start
- wsl -u root docker --version
- wsl -u root docker info
- wsl -u root docker container ls
- wsl -u root docker image ls
- wsl -u root docker run -dp 80:80 docker/getting-started
- wsl -u root docker container stop [container id]
- wsl -u root docker image rm [image id]

## Trouble-shooting when wsl.exe is not recognized

Sometimes, if we change the installed distro location, wsl.exe won't be recognized. If this happens, do the following.

1. Run "wsl --list" to find out the Linux distro name.
2. Run "wsl --unregister Ubuntu" to unregister the Linux distro. We are assuming that Ubuntu is the distro.

The above are also the commands to completely remove the Linux distro from wsl.

## Trouble-shooting Packer failure

- [How to configure logging for Packer](https://www.phillipsj.net/posts/how-to-configure-logging-for-packer/)
- [Debugging Packer Builds](https://www.packer.io/docs/debugging)
- Run "export PACKER_LOG=1"
- Run "export PACKER_LOG_PATH="packerlog.txt""
- Run "packer build -debug --var-file=inputs.pkrvars.hcl ."

## References

- [Install Linux on Windows with WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
- [Windows Server Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install-on-server)
- [Basic commands for WSL](https://docs.microsoft.com/en-us/windows/wsl/basic-commands)
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Windows Subsystem for Linux (WSL) explained](https://solidstudio.io/blog/windows-subsystem-for-linux-explained)
