FuturoCoin for docker
================

[![Docker Stats](http://dockeri.co/image/futurocoinfto/futurocoind)](https://hub.docker.com/r/futurocoinfto/futurocoind/)

Docker image that runs the FuturoCoin node in a docker container for easy development and deployment.

Requirements
------------
  * Physical machine, cloud, VPS with installed docker.
  * At least 5 GB to store the block chain files
  * At least 1 GB RAM + 2 GB swap file


Quick Start
-----------

1. Create a `futurocoind-data` volume to persist the futurocoind blockchain data, should exit immediately.  The `futurocoind-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        $ docker volume create --name=futurocoind-data
        $ docker run -v futurocoind-data:/home/futuro/node --name=futurocoind-node -d \
            -p 19000:19000 \
            -p 127.0.0.1:19008:19008 \
            futurocoinfto/futurocoind

2. Verify that the container is running and futurocoind node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                       COMMAND             CREATED             STATUS              PORTS                                                  NAMES
        27c185c2fb00        futurocoinfto/futurocoind   "futurocoin-start"  2 seconds ago       Up 1 seconds        127.0.0.1:19008->19008/tcp, 0.0.0.0:19000->19000/tcp   futurocoind-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        $ docker logs -f futurocoind-node


Documentation
-------------

* To run in testnet, add environment variable `TESTNET=1` to `docker run` as such:

        docker run -v futurocoind-data:/home/futuro/node --name=futurocoind-node -d \
            --env TESTNET=1 \
            -p 19000:19000 \
            -p 127.0.0.1:19008:19008 \
            futurocoinfto/futurocoind

* Additional documentation in the [docs folder](docs).
