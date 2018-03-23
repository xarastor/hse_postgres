#!/bin/bash
eval $(docker-machine env hse.postgres)
cd ./postgres
# ./configure --enable-cassert --enable-debug CFLAGS="-DOPTIMIZER_DEBUG"
make -j4
cd ../
sudo docker build -t postgres .
sudo docker run --name postgres postgres
sudo docker rm postgres
