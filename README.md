# Pi Hole docker scripts
If you want to browse the Internet without advertisement and without "Please turn off Adblock" messages this is your place!

The scripts in this repository ease the docker installation, the configuration and the execution of the Pi-Hole container.

All credit goes to the Pi-Hole project.

https://pi-hole.net/

## Requirements
Your machine runs a supported Linux OS and you know how to run scripts.

## Docker install
Simply run the docker_install.sh script as sudo to install docker. If the installation has been succesful you should be able to run "docker ps".

## Configuration
Run the configure.sh script as sudo to disable the local DNS and restart the network manager service. Afterwards, edit your network settings to use 0.0.0.0 (localhost) as DNS server.

## Running the docker container
Once docker has been installed and the networking has been configured, run the docker_run.sh script and enjoy
