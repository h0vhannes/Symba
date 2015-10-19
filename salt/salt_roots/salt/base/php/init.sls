php-modules:
  pkg:
    - installed
    - names:
      - php5-fpm
      - php5-mysql
      - php5-intl
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
      - php5-xdebug
      - php5-dev
      - php-apc
      - php-pear

php5_ppa:
  pkgrepo.managed:
    - ppa: ondrej/php5-5.6

php5-fpm:
  pkg.latest:
    - refresh: True
    - require:
      - pkgrepo: php5_ppa
  service.running:
      - enable: True

php-ini:
  file.managed:
    - name: /etc/php5/fpm/php.ini
    - source: salt://php/files/php.ini
    - template: jinja
    - makedirs: True
    - mode: 644

xdebugconf:
  file.managed:
    - name: /etc/php5/fpm/conf.d/20-xdebug.ini
    - source: salt://php/files/xdebug.ini
    - template: jinja
    - makedirs: True
    - mode: 644