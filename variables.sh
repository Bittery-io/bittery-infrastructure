#!/bin/bash
# CHANGE IT
export DOMAIN_NAME=emergencja
# CHANGE IT
export IS_DEVELOPMENT=true
# CHANGE IT
export BITCOIN_NETWORK=testnet
# CHANGE IT
export POSTGRES_USER=master
# CHANGE IT
export POSTGRES_PASSWORD=ofpuppets
# CHANGE IT (on prod to "bitcoind")
export BITCOIND_RPC_HOST=bitcoind
# CHANGE IT
export BITCOIND_RPC_USER=asdf
# CHANGE IT
# probably $ must be escaped as \$
export BITCOIND_RPC_AUTH="asdf:e23a5d25a62d87cb283531b8e50f16bf\$20e40e4b7484c833b068d674839ca56629ab60d7108338166e2c3611623b5924"
# CHANGE IT
export BITCOIND_RPC_PASSWORD="9VwwHZnYnarKGgL-zXKy2El5206UkPfRsQCzphJL1uE="
# CHANGE IT
export POSTGRES_DB=bitteryio_${BITCOIN_NETWORK}
