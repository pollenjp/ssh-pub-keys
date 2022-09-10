#!/bin/bash
set -eu

fetch_script_name="fetch-and-run.sh"
target_script_path="${HOME}/.ssh/${fetch_script_name}"

wget "https://pollenjp.github.io/ssh-pub-keys/${fetch_script_name}" \
    -O "${target_script_path}"
chmod 744 "${target_script_path}"

if crontab -l 2>/dev/null | grep -q "${fetch_script_name}"; then
    echo "Cron job already exists"
    exit 0
fi

(crontab -l 2>/dev/null; echo -e '* */1 * * * '"${target_script_path}") | crontab -
