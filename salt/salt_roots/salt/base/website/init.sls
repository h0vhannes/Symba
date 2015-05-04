copy-parameters:
    file:
        - managed
        - name: {{ pillar["website"]["parameters_path"] }}
        - source: salt://website/parameters.yaml
        - template: jinja

composer-update:
    cmd.run:
        - name: "composer update"
        - cwd: /var/www/