#!/bin/bash
set -e

geth_rpcapi=${geth_rpcapi:-admin,debug,eth,miner,net,personal,rpc,txpool,web3}
geth_rpccorsdomain=${geth_rpccorsdomain:-*}
geth_identity=${geth_identity:-TestnetMainNode}
geth_networkid=${geth_networkid:-2017}

geth_args=(--nodiscover --maxpeers 0)
geth_args=("${geth_args[@]}" --rpc --rpcapi $geth_rpcapi --rpcaddr 0.0.0.0 -rpccorsdomain "$geth_rpccorsdomain")
geth_args=("${geth_args[@]}" --networkid 2017)
geth_args=("${geth_args[@]}" --identity $geth_identity --networkid $geth_networkid)
geth_args=("${geth_args[@]}" --mine --minerthreads 1)

set -x

if [[ ! -e /root/.ethereum/geth ]]; then
  geth init /genesis.json
fi
if [[ ! -e /root/.ethereum/keystore/account.json ]]; then
  cp /account.json /root/.ethereum/keystore/account.json
fi

case "$1" in
  start) exec geth "${geth_args[@]}" ;;
  *) exec "$@" ;;
esac
