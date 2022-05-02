# Get started on Packer

This is just a list of web posts to ramp up on Packer. We are following

1. [Install Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli?in=packer/docker-get-started)
2. [Build an Image](https://learn.hashicorp.com/tutorials/packer/docker-get-started-build-image?in=packer/docker-get-started)
3. [Provision](https://learn.hashicorp.com/tutorials/packer/docker-get-started-provision?in=packer/docker-get-started)
4. [Variables](https://learn.hashicorp.com/tutorials/packer/docker-get-started-variables)
5. [Parallel Builds](https://learn.hashicorp.com/tutorials/packer/docker-get-started-parallel-builds?in=packer/docker-get-started)
6. [Post-Processors](https://learn.hashicorp.com/tutorials/packer/docker-get-started-post-processors?in=packer/docker-get-started)

## Useful commands

- packer --version
- packer --help
- packer init .
- packer fmt .
- packer validate .
- packer build [file name]

## Trouble-shooting Packer failure

- [How to configure logging for Packer](https://www.phillipsj.net/posts/how-to-configure-logging-for-packer/)
- [Debugging Packer Builds](https://www.packer.io/docs/debugging)
- Run "export PACKER_LOG=1"
- Run "export PACKER_LOG_PATH="packerlog.txt""
- Run "packer build -debug ."

## References

- [Get Started](https://learn.hashicorp.com/packer)
- [Provision Infrastructure with Packer](https://learn.hashicorp.com/tutorials/terraform/packer)
- [Packer Documentation](https://www.packer.io/docs)
- [Azure Virtual Machine Image Builders](https://www.packer.io/plugins/builders/azure)
- [Packer File Structure](https://discuss.hashicorp.com/t/packer-file-structure/27161)
