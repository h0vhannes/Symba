#!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------
# Run Salt states
# ----------------------------------------------------------------------------------------------------------------------

sudo sh scripts/provision.sh

# ----------------------------------------------------------------------------------------------------------------------
# Change working directory
# ----------------------------------------------------------------------------------------------------------------------

cd /var/www

# ----------------------------------------------------------------------------------------------------------------------
# Pull from SVC
# ----------------------------------------------------------------------------------------------------------------------

git checkout .
git pull

# ----------------------------------------------------------------------------------------------------------------------
# Update composer
# ----------------------------------------------------------------------------------------------------------------------

sudo composer update --optimize-autoloader

# ----------------------------------------------------------------------------------------------------------------------
# Clear cache
# ----------------------------------------------------------------------------------------------------------------------

php app/console cache:clear --env=dev
php app/console cache:clear --env=prod --no-debug
