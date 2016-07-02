#!/bin/zsh

docker stop rabbitmq
docker rm rabbitmq

docker build -t rabbitmq .

docker run -d \
	-p 5672:5672 \
	-p 15672:15672 \
	--name rabbitmq \
	rabbitmq

docker start rabbitmq
