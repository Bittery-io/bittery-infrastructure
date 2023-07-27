# bittery-infrastructure-v2 - infrastructure setup for bittery.io

# About
This project setups everything required by bittery hoster. It does not contain configuration for user LNDs hosting.

#Setup:
This instruction below assures that you have already set external dependencies

# Common steps
1. Setup all vars in ./variables.sh
2. Start ./start-all.sh
3. Provide all .variables.sh values. If needed please generate new.
4. ./rpcauth.py <user> (e.g. bitt) - generate bitcoin auth passes. Export in ./variables.sh as BITCOIND_RPC_AUTH and BITCOIND_RPC_USER and BITCOIND_RPC_PASSWORD.
## Localhost
1. Start bittery-backend manually (e.g. from Intellij).
2. Open localhost:80 - register - remember username and password (SAVE IT SOMEWHERE). 
3. Go to bittery-backend/tools and generate webhook secret. Export as BTCPAY_WEBHOOK_SECRET (in running manually bittery-backend)
4. Follow steps 4,5,6 from Production but set it in Intellij env vars insead of start-bittery-backend.sh

* If decided to start bittery-backend as docker-compose setup - bittery-backend/start-bittery-backend.sh must be modified
  and sections for localhost me replaced (uncommented) with the prod sections. Additionally docker-compose.backend.yaml
  must expose ports 3000 to localhost (for one of the services to avoid port duplicate).
## Production
1. Generate all lets-encrypt certificates - then ./move-bittery-lentsencrypt-cert.sh
2. Go to btcpay.bittery.io - register - remember username and password (SAVE IT SOMEWHERE).
3. Go to btcpay.bittery.io - generate API KEY. Click top right corner icon of human, then API Keys and generate new. Export in start-bittery-backend.sh as BTCPAY_ADMIN_API_KEY.
4. Go to bittery-backend/tools and generate webhook secret. Export in start-bittery-backend.sh as BTCPAY_WEBHOOK_SECRET
5. Go to bittery-backend/tools and create new bittery store for receiving subscription payments. Export in start-bittery-backend.sh as BITTERY_SUBSCRIPTION_PAYMENTS_STORE_ID.
6. Export all variables in bittery-backend/start-bittery-backend.sh

# External dependencies
- Digital Ocean - required API key. Export as MAILGUN_API_KEY.
- Mailgun - required API key. Export as DIGITAL_OCEAN_TOKEN.

# Other dependencies to provide
- ssh keys are required for remote exec - must be generated manually and be in expected path (SSH_PRIV_KEY_PATH_ON_HOST). Keys must be securely stored. 
- BITTERY_NODE_FOR_SUBSCRIPTION_URI - public address of Bittery LND used for payments for subscription
- DIGITAL_OCEAN_SSH_KEY_NAME - must be generated for Digital Ocean in order to allow ssh to droplets


# Important to backup
- ./variables.sh - env vars values
- ./bittery-backend/start-bittery-backend.sh
- ssh keys
- bittery node for payments

# Important to be secured
- bitcoind passwords
- Mailgun API key
- Digital Ocean API key
- BTCPay API key + passwords
- ssh keys: public and private
- postgres passwords
- bittery node passwords + macaroons + static channel backups

# Important to regular backup on second disk
- postgres database dump
- ./volumes/bittery-backend/lnd_hosted_files - here are generated user files on during normal bittery-backend usage
