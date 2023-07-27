#!/bin/bash
#This script MUST BE RUN INSIDE bitter-backend folder
source ../variables.sh

# LOCALHOST ONLY
# SET IT
# Required for docker-compose (not by bittery-backend docker)
export SSH_PRIV_KEY_PATH_ON_HOST=/some/path
export CLIENT_URL_ADDRESS=http://localhost:8080
export IS_DEVELOPMENT_ENV=true
export DEVELOPMENT_HOSTNAME=emergencja
# SET IT
export DIGITAL_OCEAN_SSH_KEY_NAME=a0:9a:b1:09:1a:c2:22:85:22:e7:5d:12:76:3a:10:01
# address must be reached from internet
export CUSTOM_LOGO_BTCPAY_URL=http://localhost:8080/statics/bittery-glow-last.svg
# address must be reached from internet
export CUSTOM_CSS_BTCPAY_URL=http://localhost:8080/statics/checkout.css
#SET IT
export BTCPAY_ADMIN_API_KEY=2a4501a4ef6cd7463bff15d2177f38284eac06ff
#SET IT
export BITTERY_SUBSCRIPTION_PAYMENTS_STORE_ID=8pR2S7ZWhfHULfMDixVDXzwVUBeY4FRfLpsnWs3xdY86
# GENERATE IT in bittery-backend then set here
export BTCPAY_FACADE_WEBHOOK_SECRET=7GSPhpCtKH7AGXNAhVLZFN

## PROD ONLY
#SET IT
# Required for docker-compose (not by bittery-backend docker)
#export SSH_PRIV_KEY_PATH_ON_HOST=/some/path
#export BTCPAY_URL=https://btcpay.bittery.io
#export CLIENT_URL_ADDRESS=https://app.bittery.io
#export IS_DEVELOPMENT_ENV=false
## SET IT
#export DIGITAL_OCEAN_SSH_KEY_NAME=a0:9a:b1:09:1a:c2:22:85:22:e7:5d:12:76:3a:10:01
## address must be reached from internet
#export CUSTOM_LOGO_BTCPAY_URL=https://app.bittery.io/statics/bittery-glow-last.svg
## address must be reached from internet
#export CUSTOM_CSS_BTCPAY_URL=https://app.bittery.io/statics/checkout.css
##SET IT
#export BTCPAY_ADMIN_API_KEY=2a4501a4ef6cd7463bff15d2177f38284eac06ff
##SET IT
#export BITTERY_SUBSCRIPTION_PAYMENTS_STORE_ID=5d0238098ds080298302983290382
## GENERATE IT in bittery-backend then SET IT here
#export BTCPAY_FACADE_WEBHOOK_SECRET=7GSPhpCtKH7AGXNAhVLZFN

# COMMON FOR LOCALHOST AND PROD
export ENCRYPTION_PASSWORD_SALT_ROUNDS=8
export OAUTH2_TOKEN_CLIENT_SECRET=u8eFLaz_oXsB
export SESSION_EXPIRES_IN_HOURS=1
export RTL_URL=/rtl
#SET IT
export MAILGUN_API_KEY=asdf
export PASSWORD_RESET_LINK_VALIDITY_HOURS=4
export PASSWORD_RESET_EMAIL_HOURS_MEASURE_PERIOD_HOURS=24
export PASSWORD_RESET_EMAIL_MEASURE_PERIOD_LIMIT=2
export REGISTRATION_ENABLED=true
export LOGIN_ENABLED=true
export CREATE_INVOICE_ENABLED=true
export LND_HOSTED_VERSION=v0.14.1-beta
export RTL_HOSTED_VERSION=v0.11.2
export LND_SUBSCRIPTION_PRICE_USD=29.0
#SET IT
export EMAIL_FOR_ADMIN_NOTIFICATIONS=somemail@mail.mail
#SET IT
export DIGITAL_OCEAN_TOKEN=some-token
#SET IT
export BITTERY_NODE_FOR_SUBSCRIPTION_URI=asdfasdfas@111.111.111.111:9735
export APP_PORT=3000
export LND_HOSTED_FILE_FOLDER_PATH=/lnd_hosted_files
export DB_HOST=postgres
export DB_PORT=5432
export SSH_PRIV_KEY_PATH=/ssh/id_rsa
export BTCPAY_BACKEND_ONLY_URL=http://btcpayserver:49392
export DB_USER=${POSTGRES_USER}
export DB_DATABASE=${POSTGRES_DB}
export DB_PASSWORD=${POSTGRES_PASSWORD}
export BITCOIND_RPC_USER=${BITCOIND_RPC_USER}
export BITCOIND_RPC_PASSWORD=${BITCOIND_RPC_PASSWORD}
# must be reachable from Internet - is used by droplets
export BITCOIND_RPC_HOST_FROM_INTERNET=bitcoind.bittery.io

#BACKEND 1
#SET IT
export RUN_STATIC_CHANNEL_BACKUP_SCHEDULER_BACKEND_1=true
#SET IT
export RUN_SUBSCRIPTION_DISABLE_SCHEDULER_BACKEND_1=true
#SET IT
export RUN_SUBSCRIPTION_RENEW_EMAIL_SCHEDULER_BACKEND_1=true

#BACKEND 2
#SET IT
export RUN_STATIC_CHANNEL_BACKUP_SCHEDULER_BACKEND_2=false
#SET IT
export RUN_SUBSCRIPTION_DISABLE_SCHEDULER_BACKEND_2=false
#SET IT
export RUN_SUBSCRIPTION_RENEW_EMAIL_SCHEDULER_BACKEND_2=false
#SET IT
export RECAPTCHA_SITE_KEY=7La23838d08KZKJDHLJ302JKJLKJLKJ
#SET IT
export RECAPTCHA_SECRET_KEY=902JLKJDL20323-2380DJLKJSDLK203JK2

docker-compose -f ../docker-compose/docker-compose.backend.yaml down
docker-compose -f ../docker-compose/docker-compose.backend.yaml up -d
