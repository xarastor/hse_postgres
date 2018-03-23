FROM ubuntu:latest

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install gcc make flex bison libreadline-dev zlib1g-dev jade -y
#RUN apt-get install make -y

# Copy source code
RUN mkdir /code
WORKDIR /code
ADD postgres /code/

# Build postgres
# RUN ./configure --enable-cassert --enable-debug 
# RUN make -j4
RUN make install
RUN adduser postgres
RUN mkdir /usr/local/pgsql/data
RUN chown postgres /usr/local/pgsql/data

# Init database
USER postgres
RUN /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data
ENV PGHOST /tmp

# Run server
CMD ["/usr/local/pgsql/bin/postgres", "-D", "/usr/local/pgsql/data", "-d", "5"]
