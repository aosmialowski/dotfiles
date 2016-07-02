#!/bin/zsh

docker stop mysql
docker rm mysql

docker build -t mysql .

docker run -d \
	-p 3306:3306 \
	-v /srv/mysql:/var/lib/mysql \
	--name mysql \
	mysql

docker start mysql
