#!/bin/bash

if [ -f vault.pid ]; then
  echo "Vault PID file already exists"
  exit 1
fi

export VAULT_LICENSE_PATH="license-vault.hclic"

vault server -dev -dev-root-token-id=root -dev-listen-address="127.0.0.1:8200" >./vault.log 2>&1 &

echo $! > vault.pid

sleep 5

echo "Vault started with PID:$(cat vault.pid)"

# Check if running Vault Enterprise

vault version | grep ent
