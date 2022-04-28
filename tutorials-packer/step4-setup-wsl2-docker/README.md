# Set up WSL2 with Ubuntu and Docker on virtual machine running Windows 11

**_NOTE: WSL2 is not supported on Windows Server 2019 or 2022 yet. We cannot use Docker Engine on WSL1. Check [WSL2 Support for Windows Server 2019
](https://github.com/MicrosoftDocs/WSL/issues/678) and [WSL 2 broken on Windows Server Preview](https://github.com/microsoft/WSL/issues/6301 ) for more details._**

## Useful commands

Power Shell

- Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
- restart Windows
- Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
- restart Windows

Windows Shell

- wsl --set-default-version 2
- wsl --update
- wsl --shutdown
- wsl --install -d Ubuntu
- timeout 60
- restart windows
- wsl -u root sudo apt-get remove docker docker-engine docker.io containerd runc
- wsl -u root sudo apt-get update
- wsl -u root sudo apt-get -y upgrade
- wsl -u root sudo apt-get install ca-certificates curl gnupg lsb-release
- wsl -u root /bin/bash -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
- wsl -u root /bin/bash -c "echo 'deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable' | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"
- wsl -u root sudo apt-get update
- wsl -u root sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose

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

## References

- [Install Linux on Windows with WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
- [Windows Server Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install-on-server)
- [Basic commands for WSL](https://docs.microsoft.com/en-us/windows/wsl/basic-commands)
- [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
- [Windows Subsystem for Linux (WSL) explained](https://solidstudio.io/blog/windows-subsystem-for-linux-explained)
