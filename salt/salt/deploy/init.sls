export-environment:
  cmd.run:
    - name: export SYMFONY_ENV={{ pillar["project"]["env"] }}
    - cwd: /var/www

composer-update:
  cmd.run:
    - name: sudo composer update --optimize-autoloader
    - cwd: /var/www

clear-cache:
  cmd.run:
    - name: sudo php app/console cache:clear --env={{ pillar["project"]["env"] }}
    - cwd: /var/www