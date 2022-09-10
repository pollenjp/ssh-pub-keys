#!/bin/bash
set -eu

cargo install authorized-keys-merger

fetch_script_name="fetch-ssh-keys.sh"
target_script_path="${HOME}/.ssh/${fetch_script_name}"

cp "./${fetch_script_name}" "${target_script_path}"
chmod 744 "${target_script_path}"

if crontab -l 2>/dev/null | grep -q "${fetch_script_name}"; then
    echo "Cron job already exists"
    exit 0
fi

(crontab -l 2>/dev/null; echo -e '* */1 * * * '"${target_script_path}") | crontab -
