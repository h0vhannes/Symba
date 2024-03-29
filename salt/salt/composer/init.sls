get-composer:
  cmd.run:
    - name: "CURL=`which curl`; $CURL -sS https://getcomposer.org/installer | php"
    - unless: test -f /usr/local/bin/composer
    - cwd: /root/

install-composer:
  cmd.wait:
    - name: mv composer.phar /usr/local/bin/composer
    - cwd: /root/
    - watch:
      - cmd: get-composer