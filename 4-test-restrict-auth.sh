#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login -method=userpass username=colin password=password

vault kv get secret/hello

vault auth disable aws

vault auth enable aws