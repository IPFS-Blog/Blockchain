FROM ethereum/client-go:v1.11.6

COPY genesis.json /tmp

COPY share/miner/data/keystore /root/.ethereum/keystore

RUN geth init /tmp/genesis.json \
    && rm -f ~/.ethereum/geth/nodekey

ENTRYPOINT ["geth"]