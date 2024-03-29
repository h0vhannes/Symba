#!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------
# Check for `sudo`
# ----------------------------------------------------------------------------------------------------------------------

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# ----------------------------------------------------------------------------------------------------------------------
# Update Aptitude
# ----------------------------------------------------------------------------------------------------------------------

sudo apt-get update

# ----------------------------------------------------------------------------------------------------------------------
# Run SaltStack
# ----------------------------------------------------------------------------------------------------------------------

sudo cp /var/www/salt/minion.conf /etc/salt/minion
sudo mkdir -p /srv/salt_roots && cp -a /var/www/salt/. /srv/salt_roots/
sudo salt-call --local state.highstate