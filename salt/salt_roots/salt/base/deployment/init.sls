copy-parameters:
  file:
    - managed
    - name: {{ pillar["deployment"]["parameters_path"] }}
    - source: salt://deployment/parameters.yaml
    - template: jinja

export-environment:
  cmd.run:
    - name: export SYMFONY_ENV={{ pillar["project"]["env"] }}
    - cwd: {{ pillar["deployment"]["project_path"] }}

composer-update:
  cmd.run:
    - name: composer update --optimize-autoloader
    - cwd: {{ pillar["deployment"]["project_path"] }}

clear-cache:
  cmd.run:
    - name: php app/console cache:clear --env={{ pillar["project"]["env"] }}
    - cwd: {{ pillar["deployment"]["project_path"] }}