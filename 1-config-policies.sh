#!/bin/bash

export VAULT_ADDR=http://127.0.0.1:8200

vault login root

# Configure policies for both Vault Agent and Cert Manager
vault policy write colin-acl - <<EOF

path "secret/data/hello" {
  capabilities = ["create","read","update","delete","list"]
}

path "sys/auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

path "auth/token/create*" {
  capabilities = ["create","read","update","delete","list","sudo"]
}

path "auth/token/roles/*" {
  capabilities = ["create","read","update","delete","list","sudo"]
}

EOF

export RAM_POLICY=$(base64 restrict-auth.sentinel)

vault write sys/policies/egp/restrict-auth-methods \
    policy="${RAM_POLICY}" \
    paths="/sys/auth/*" \
    enforcement_level="hard-mandatory"

export NET_POLICY=$(base64 restrict-nets.sentinel)

vault write sys/policies/egp/restrict-nets \
    policy="${NET_POLICY}" \
    paths="auth/token/create/*,auth/token/roles/*" \
    enforcement_level="hard-mandatory"