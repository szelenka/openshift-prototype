#!/bin/bash
set -e

# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
# if the running user is an Arbitrary User ID
if ! whoami &> /dev/null; then
  # make sure we have read/write access to /etc/passwd
  if [ -w /etc/passwd ]; then
    # write a line in /etc/passwd for the Arbitrary User ID in the 'root' group
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

# https://success.docker.com/article/use-a-script-to-initialize-stateful-container-data
if [ "$1" = 'supervisord' ]; then
    exec /usr/bin/supervisord
fi


exec "$@"