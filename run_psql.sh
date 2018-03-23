eval $(docker-machine env hse.postgres)
sudo docker exec -it postgres /usr/local/pgsql/bin/psql

