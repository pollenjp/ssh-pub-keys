#!/bin/bash
set -eu

fetch_script_name="fetch-and-run.sh"
target_script_path="${HOME}/.ssh/${fetch_script_name}"

wget --quiet "https://pollenjp.github.io/ssh-pub-keys/${fetch_script_name}" \
    -O "${target_script_path}"
chmod 744 "${target_script_path}"

if crontab -l 2>/dev/null | grep -q "${fetch_script_name}"; then
    echo "Cron job already exists"
    exit 0
fi

tmp_crontab_file="${HOME}/.ssh/crontab.edit"
if current_crontab="$( crontab -l 2> /dev/null )"; then
    echo current_crontab > "${tmp_crontab_file}"
fi
echo '* */1 * * * '"${target_script_path}" >> "${tmp_crontab_file}"
crontab "${tmp_crontab_file}"
rm "${tmp_crontab_file}"
