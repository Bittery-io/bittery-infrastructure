#!/bin/bash
PWD=$(dirname "$0")
LETSENCRYPT_CERT_PATH=$1
CERT_NAME=$2
if [ $# -eq 0 ]; then
  echo 'Usage: ./move-bittery-letsencrypt-cert.sh <LETSENCRYPT_CERT_PATH> (path to folder where new bittery.io certs are e.g. /etc/letsencrypt/archive/bittery.io-0001) <CERT_NAME> (bittery.io or app.bittery.io)'
  echo 'Example: ./move-bittery-letsencrypt-cert.sh /etc/letsencrypt/archive/bittery.io-0001 bittery.io'
  exit 1
else
  if [ "$CERT_NAME" != "bittery.io" ] && [ "$CERT_NAME" != "app.bittery.io" ]; then
    echo 'Error: <CERT_NAME> must be bittery.io or app.bittery.io'
    exit 1
  fi
  LETSENCRYPT_CERT_FULLCHAIN_PEM_PATH="${LETSENCRYPT_CERT_PATH}/fullchain1.pem"
  LETSENCRYPT_CERT_FULLCHAIN_PRIVKEY_PATH="${LETSENCRYPT_CERT_PATH}/privkey1.pem"
  #Check files exist
  if test -f "$LETSENCRYPT_CERT_FULLCHAIN_PEM_PATH"; then
    echo "$LETSENCRYPT_CERT_FULLCHAIN_PEM_PATH exists - GOOD"
  else
    echo "$LETSENCRYPT_CERT_FULLCHAIN_PEM_PATH doesnt exist - BAD. Please assure given argument path is correct."
    exit 1
  fi
  if test -f "$LETSENCRYPT_CERT_FULLCHAIN_PRIVKEY_PATH"; then
    echo "$LETSENCRYPT_CERT_FULLCHAIN_PRIVKEY_PATH exists - GOOD"
  else
    echo "$LETSENCRYPT_CERT_FULLCHAIN_PRIVKEY_PATH doesnt exist - BAD. Please assure given argument path is correct."
    exit 1
  fi

  # Move files to nginx folder (create folder if not exists)
  mkdir -p $PWD/volumes/nginx/certs/$CERT_NAME
  sudo cp $LETSENCRYPT_CERT_FULLCHAIN_PEM_PATH $PWD/volumes/nginx/certs/$CERT_NAME/fullchain.pem
  sudo cp $LETSENCRYPT_CERT_FULLCHAIN_PRIVKEY_PATH $PWD/volumes/nginx/certs/$CERT_NAME/privkey.pem
  docker exec -t nginx sh -c 'nginx -s reload' 2>&1
  echo 'Successfully moved certs to NGINX folder and reloaded nginx. All good, all done.'
fi
