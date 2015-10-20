export-environment:
  cmd.run:
    - name: export SYMFONY_ENV={{ pillar["project"]["env"] }}
    - cwd: {{ pillar["project"]["root_path"] }}

composer-update:
  cmd.run:
    - name: sudo composer update --optimize-autoloader
    - cwd: {{ pillar["project"]["root_path"] }}

clear-cache:
  cmd.run:
    - name: sudo php app/console cache:clear --env={{ pillar["project"]["env"] }}
    - cwd: {{ pillar["project"]["root_path"] }}