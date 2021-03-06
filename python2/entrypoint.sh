#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-1000}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user
export HOME=/home/user

exec /usr/local/bin/gosu user "$@"
