get-composer:
  cmd.run:
    - name: "CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php"
    - unless: test -f /usr/local/bin/composer
    - cwd: {{ pillar["system"]["root_path"] }}

install-composer:
  cmd.wait:
    - name: mv composer.phar /usr/local/bin/composer
    - cwd: {{ pillar["system"]["root_path"] }}
    - watch:
      - cmd: get-composer