#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login root

# Enable userpass auth method

vault auth enable userpass 

# Create userpass colin/password

vault write auth/userpass/users/colin \
    password=password \
    policies="colin-acl"
