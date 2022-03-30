#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login -method=userpass username=colin password=password

# Attempt to create an orphan token.
# Expected to fail.

vault write -f auth/token/create-orphan

# Attempt to create a role called colin that would allow the creation of an orphan token
# Expected to fail.

vault write auth/token/roles/colin \
    allowed_policies="colin-acl" \
    orphan=true \
    token_ttl=8h

# Attempt to 