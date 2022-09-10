#!/bin/bash
set -eu

keys_filepath="${HOME}/.ssh/fetched-keys.txt"
authorized_keys_filepath="${HOME}/.ssh/authorized_keys"

wget "https://pollenjp.github.io/ssh-pub-keys/keys.txt" \
    -O "${keys_filepath}"

authorized-keys-merger "${authorized_keys_filepath}" "${keys_filepath}"
