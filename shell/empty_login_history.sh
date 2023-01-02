#!/usr/bin/env bash
# Clear visit log
# wget -P /tmp -N --no-check-certificate "https://raw.githubusercontent.com/afandiazmi/v2RayVPN/main/shell/empty_login_history.sh" && chmod 700 /tmp/empty_login_history.sh && /tmp/empty_login_history.sh
echo "Clear the sky"
echo > /var/log/wtmp
echo > /var/log/btmp
echo > /var/log/lastlog
echo > ~/.bash_history
echo "Cleared"
echo "delete script"
rm -rf /tmp/empty_login_history.sh
history -c
echo "done"
