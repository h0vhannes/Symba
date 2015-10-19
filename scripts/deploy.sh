#!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------
# Check for `sudo`
# ----------------------------------------------------------------------------------------------------------------------

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# ----------------------------------------------------------------------------------------------------------------------
# Do some stuff
# ----------------------------------------------------------------------------------------------------------------------

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ----------------------------------------------------------------------------------------------------------------------
# Check for environment
# ----------------------------------------------------------------------------------------------------------------------

ENV=""
DEV_ENV="dev"
PROD_ENV="prod"
LOCAL_ENV="local"
INVALID_ENV_MESSAGE="No valid environment supplied. Use local|dev|prod."

if [ -z "$1" ]; then
	echo "$INVALID_ENV_MESSAGE"
	exit 1
else
    if [ "$1" != "$DEV_ENV" -a "$1" != "$PROD_ENV" -a "$1" != "$LOCAL_ENV" ]; then
        echo "$INVALID_ENV_MESSAGE"
        exit 1
    else
        ENV="$1"
    fi
fi

# ----------------------------------------------------------------------------------------------------------------------
# Copy salt files
# ----------------------------------------------------------------------------------------------------------------------

sudo cp /var/www/salt/minion.conf /etc/salt/minion
sudo mkdir -p /srv/salt_roots && cp -a /var/www/salt/salt_roots/. /srv/salt_roots/

# ----------------------------------------------------------------------------------------------------------------------
# Run Salt
# ----------------------------------------------------------------------------------------------------------------------

sudo salt-call --local state.highstate env="$ENV"