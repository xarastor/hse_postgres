#!/bin/bash
eval $(docker-machine env hse.postgres)
cd ./postgres
make clean
