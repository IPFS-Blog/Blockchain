#!/bin/bash

# Read env geth_init_passwd
passwd1="$GETH_ACCOUNT1_PASSWORD"
passwd2="$GETH_ACCOUNT2_PASSWORD"

# check set env
if [ -z "$passwd1" ] && [ -z "$passwd2" ]; then
  echo "env geth_init_passwd have one not set"
  exit 1
fi

if [ ! -f /share/.init ]; then

    mkdir -p /share/miner

    echo "init account"
    cd /share/miner
    echo "$passwd1" > /tmp/password1
    echo "$passwd2" > /tmp/password2
    geth account new  --datadir ./data --password /tmp/password1
    geth account new  --datadir ./data --password /tmp/password2

    # 設定 keystore 目錄路徑
    keystore_dir="/share/miner/data/keystore"

    # 列出 keystore 目錄中的檔案
    files=$(ls "$keystore_dir")

    # 計數器
    count=0

    # 遍歷每個檔案，提取檔案的值並格式化輸出
    for file in $files; do
        address=$(echo "$file" | awk -F"--" '{print $3}')
        output="Address$count: { 0x$address }"
        echo "$output"
        count=$((count + 1))
    done
    touch /share/.init
    # chmod 777 -R /share
    # for testing can use
else
    echo "Completed initial !!"
fi