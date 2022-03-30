# vault-sentinel-auth-nets
POC that uses example Sentinel Policies that restrict the auth methods that can be created on Vault, and restrict the creation of non-entity tokens.

# Pre-requisites

* Vault Enterprise (tested using 1.9.3+ent)
* Vault Enterprise License

# Steps

1. Ensure your vault license file `license-vault.hclic` is sitting within this directory.
1. Run the scripts in order from `0...` to `3...`
1. Run script `4-test-restrict-auth.sh` and observe the failure to create an authentication method type not listed within the policy.
1. Run script `5-test-nets.sh` and observe the failure to create a non-entity token.
1. When finished, run script `99-kill-vault.sh` to kill the Vault process.