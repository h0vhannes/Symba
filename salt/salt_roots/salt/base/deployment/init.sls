copy-parameters:
    file:
        - managed
        - name: {{ pillar["deployment"]["parameters_path"] }}
        - source: salt://deployment/parameters.yaml
        - template: jinja

composer-update:
    cmd.run:
        - name: "composer update"
        - cwd: {{ pillar["deployment"]["project_path"] }}