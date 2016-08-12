#!/bin/zsh

docker stop mongodb
docker rm mongodb

docker build -t mongodb .

docker run -d \
	-p 27017:27017 \
	-v /srv/mongodb:/data/db \
	--name mongodb \
	mongodb

docker start mongodb
