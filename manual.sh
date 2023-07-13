#!/bin/bash
docker run -it --rm -v ./share:/share --entrypoint /bin/sh ethereum/client-go:v1.11.6

# geth account new  --datadir /share/miner/data