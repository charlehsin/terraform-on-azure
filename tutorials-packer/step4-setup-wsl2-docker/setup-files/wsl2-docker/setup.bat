@ECHO OFF
wsl --update
wsl --shutdown
wsl --install -d Ubuntu
PAUSE
ECHO We will use root user to set up docker.
PAUSE
wsl -u root sudo apt-get remove docker docker-engine docker.io containerd runc
wsl -u root sudo apt-get update
wsl -u root sudo apt-get -y upgrade
wsl -u root sudo apt-get install ca-certificates curl gnupg lsb-release
wsl -u root /bin/bash -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
wsl -u root /bin/bash -c "echo 'deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable' | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"
wsl -u root sudo apt-get update
wsl -u root sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose
ECHO Docker and Docker compose are installed. Need to run "wsl -u root sudo service docker start" after restarting.
PAUSE
@ECHO ON