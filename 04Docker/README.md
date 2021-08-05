## DOCKER

### Base commands:

* docker ps -a		//show all docker containers
* docker images	//show local images 
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

### Advanced commands:

Run ubuntu container interactively & attached
docker run -it ubuntu /bin/bash

Run detached & ports forwarding from 8080 to 1234 
docker run -d -p 1234:8080 tomcat 

Run detached with new name and REMOVE after exited
docker run --name container1 -d -rm myimage

Run with TimeZone environment
docker run --name container1 -e TZ=Europe/Kyiv myimage

Run with mount external volume
docker run --name container1 -v /var/mylocaldir:/var/projectdir myimage



Remove all containers by ID
docker rm -f $(docker ps -qa)

Build own Docker image
docker build -t myimage:v1 .

Remove all images by ID
docker rmi $(docker images -q)

Info about image
docker image history myimage

### Work with volumes
docker volume ls
docker volume create newvolume
docker run -v newvolume:/var/myproject myimage




### Install Docker (Debian 10)
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

### Dockerfile sample

FROM ubuntu:21.04

RUN apt update && apt install -y apache2

CMD ["","",""]

ENTRYPOINT echo $VAR1

WORKDIR /var/httpd

COPY <source> <destination>

EXPOSE 80

ENV VAR1 "HELLO"

ENV TZ=Europe/Kyiv

USER 1001

VOLUME ["/dir1","/dir2"] 






## Docker compose

1. Create file: docker-compose.yaml

version: "3"

services:
  device-monitoring:
    image: artemprojects/device-monitoring
    volumes:
      - "./devices:/usr/src/app/resources/devices"
    restart: always
    ports:
      - 127.0.0.1:8080:8080
    environment:
      - DEMO_MODE=disable
      - MOCK_DATA_COUNT=20
      - DISCOVERY_WORKER_POOL=20
      - LOG_MODE=dev
      - TZ=Europe/Moscow
      - DISCOVERY_PERIOD_SEC=30
      - EXECUTOR_SERVICE_IMPL=PingExecutorService

### Command to run
docker-compose up -d



## Info

https://youtu.be/I18TNwZ2Nqg



