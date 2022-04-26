# Set up WSL2 with Ubuntu and Docker on virtual machine running Windows Server

**_NOTE: This tutorial is blocked as WSL2 is not supported on Windows Server 2019 or 2022 yet. We cannot use Docker Engine on WSL1. Check [WSL2 Support for Windows Server 2019
](https://github.com/MicrosoftDocs/WSL/issues/678) and [WSL 2 broken on Windows Server Preview](https://github.com/microsoft/WSL/issues/6301 ) for more details._**

## Useful commands

- Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName Microsoft-Windows-Subsystem-Linux
- restart Windows
- Enable-WindowsOptionalFeature -Online -NoRestart -FeatureName VirtualMachinePlatform
- restart Windows

## Trouble-shooting when wsl.exe is not recognized

Sometimes, if we change the installed distro location, wsl.exe won't be recognized. If this happens, do the following.

1. Run "wslconfig /l" to find out the Linux distro name.
2. Run "wslconfig /u Ubuntu" to unregister the Linux distro. We are assuming that Ubuntu is the distro.

The above are also the commands to completely remove the Linux distro from wsl.

## References

- [Windows Server Installation Guide](https://docs.microsoft.com/en-us/windows/wsl/install-on-server)
- [Basic commands for WSL](https://docs.microsoft.com/en-us/windows/wsl/basic-commands)
