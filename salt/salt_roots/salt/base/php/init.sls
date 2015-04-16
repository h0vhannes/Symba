php-latest:
  pkg:
    - installed
    - names:
      - php5-cli
      - php5-fpm
      - php5-mysql
      - php5-intl

phpconf:
  file.managed:
    - name: /etc/php5/fpm/php.ini
    - source: salt://php/php.ini
    - template: jinja
    - makedirs: True
    - mode: 644