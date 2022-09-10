#!/bin/bash
set -eu

curl --proto '=https' -sSf \
    "https://pollenjp.github.io/ssh-pub-keys/update-authorized-keys.sh" \
  | bash
