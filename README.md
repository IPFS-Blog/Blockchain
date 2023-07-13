# IPFS-Blog Blockchain

## Environment variables must be set first
```bash
# copy env
cp .env.example .env

# NETWORK_ID must with the genesis.json(config.chainId) the same. 

# GETH_ACCOUNT1_PASSWORD, GETH_ACCOUNT2_PASSWORD will use in account initialization.

# BOOT_NODE: P2P node key as hex (for testing),
# so recommend to remove this parameter and 
# manually handle joining nodesin in production. 

# BOOT_NODE_ENODE: Comma separated enode URLs for P2P discovery bootstrap.

# MINER_ADDRESS: specify the address of the account to receive mining rewards.
```
## Account initialization
#### You can use in genesis.json for account default amount or normal account.
```
docker-compose -f docker-compose-init.yml up
```
```
ethereum    | Your new key was generated
ethereum    | 
ethereum    | Public address of the key:   0xAD28c3E05A41a0d791d05693e84BCd029391deF2
ethereum    | Path of the secret key file: data/keystore/UTC--2023-07-13T18-51-07.551827343Z--ad28c3e05a41a0d791d05693e84bcd029391def2
ethereum    | 
ethereum    | - You can share your public address with anyone. Others need it to interact with you.
ethereum    | - You must NEVER share the secret key with anyone! The key controls access to your funds!
ethereum    | - You must BACKUP your key file! Without the key, it's impossible to access account funds!
ethereum    | - You must REMEMBER your password! Without the password, it's impossible to decrypt the key!
ethereum    | 
ethereum    | Address0: { 0xd30bc9ed211cca30c1a44b76ee260f6d90495308 }
ethereum    | Address1: { 0xad28c3e05a41a0d791d05693e84bcd029391def2 }
ethereum exited with code 0
```
#### account will like
```
Address0: { 0xd30bc9ed211cca30c1a44b76ee260f6d90495308 }
Address1: { 0xad28c3e05a41a0d791d05693e84bcd029391def2 }
```
The data will store in {$project}/share/miner/data/keystore.

### If you want to create account by manual.
```
cd {$project}
sh manual.sh
# or
docker run -it --rm -v ./share:/share --entrypoint /bin/sh ethereum/client-go:v1.11.6

# but must create accont by this command will bring the data when initializing.
geth account new  --datadir /share/miner/data
```

### After the creation is complete, put the account that needs to be specified into the environment configuration file.
```bash
#.env
MINER_ADDRESS=0xad28c3e05a41a0d791d05693e84bcd029391def2
```

## system initialization
```bash
docker-compose up 
```
## I wish you a good day.
---
## borrow this article.
https://medium.com/scb-digital/running-a-private-ethereum-blockchain-using-docker-589c8e6a4fe8


