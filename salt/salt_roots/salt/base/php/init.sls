php-latest:
  pkg:
    - installed
    - names:
      - php5-cli
      - php5-fpm
      - php5-mysql
      - php5-intl
      - php5-adodb
      - php5-cgi
      - php5-curl
      - php5-gd
      - php5-imagick
      - php5-imap
      - php5-json
      - php5-ldap
      - php5-mcrypt
      - php5-memcache
      - php5-memcached
      - php5-mysqlnd
      - php5-redis
      - php5-sqlite
      - php5-mongo
      - php-apc

phpconf:
  file.managed:
    - name: /etc/php5/fpm/php.ini
    - source: salt://php/php.ini
    - template: jinja
    - makedirs: True
    - mode: 644