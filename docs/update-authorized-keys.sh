#!/bin/bash
set -eu

keys_filepath="${HOME}/.ssh/fetched-keys.txt"
merged_keys_filepath="${HOME}/.ssh/merged-keys.txt"
authorized_keys_filepath="${HOME}/.ssh/authorized_keys"

touch "${keys_filepath}" && chmod 600 "${keys_filepath}"
touch "${merged_keys_filepath}" && chmod 600 "${merged_keys_filepath}"
touch "${authorized_keys_filepath}" && chmod 600 "${authorized_keys_filepath}"

wget "https://pollenjp.github.io/ssh-pub-keys/keys.txt" \
    -O "${keys_filepath}"

function extract() {
    local query="$1"
    local filepath="$2"

    if ! grep -q "${query}" "${filepath}"; then
        echo "${query}"
    fi
}

cat "${authorized_keys_filepath}" > "${merged_keys_filepath}"
while IFS= read -r line; do
    extract "${line}" "${authorized_keys_filepath}" >> "${merged_keys_filepath}"
done < "${keys_filepath}"

cat "${merged_keys_filepath}" > "${authorized_keys_filepath}"
