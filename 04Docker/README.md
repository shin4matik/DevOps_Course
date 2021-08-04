## DOCKER

### Base commands:

* docker ps -a		//show all docker containers
* docker images	//show local images показать образы, скачанные локально.
* docker search <> 	//search image in registry (DockerHub)
* docker pull <> 	//download image from registry to localhost
* docker build <</path/to/dir>> 	//build image
* docker run <> 	// run container
* docker rm <> 	//remove container
* docker rmi <>	//remove image
* docker logs <> 	//logs of container
* docker start/stop/restart <> //work with container
* docker tag myimage:v1 myimage:copy	//dublicate image with new tag

* docker commit 6ew7ewe889s myimage:v2	//copy runnig container

* docker exec -it 6re789eer /bin/bash	//enter to container



Run ubuntu container interactively & attached
docker run -it ubuntu /bin/bash

Run detached & ports forwarding from 8080 to 1234 
docker run -d -p 1234:8080 tomcat 

Build own Docker image
docker build -t myimage:v1 .




Install Docker (Debian 10)
-------------------------------------
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo   "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
  
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

sudo docker run hello-world
----------------------------------------

Dockerfile





https://youtu.be/I18TNwZ2Nqg





