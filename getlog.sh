eval $(docker-machine env hse.postgres.dev)
sudo docker exec -it postgres /usr/local/pgsql/bin/psql

