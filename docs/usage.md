# Usage

After running futurocoind container You will be able to run RPC command inside it. To do this exec command:

    $ docker exec -it futurocoind-node bash

We created bash script to easiest run RPC commands inside container.

    $ futurocoin-node rpc_command [...args]

For example, to check node status exec getinfo command:

    $ futurocoin-node getinfo

Full list of rpc command you can find below

https://en.bitcoin.it/wiki/Original_Bitcoin_client/API_calls_list
