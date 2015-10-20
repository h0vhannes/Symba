php5_ppa:
  pkgrepo.managed:
    - ppa: ondrej/php5-5.6

php-modules:
  pkg:
    - installed
    - names:
      - php5-fpm
      - php5-mysql
      - php5-intl
      - php5-cgi
      - php5-curl
      - php5-imap
      - php5-json
      - php5-ldap
      - php5-mcrypt
      - php5-mysqlnd
      - php5-xdebug
      - php5-dev
      - php-apc
      - php-pear
    - skip_verify: True

php-ini:
  file.managed:
    - name: /etc/php5/fpm/php.ini
    - source: salt://php/files/php.ini
    - template: jinja
    - makedirs: True
    - mode: 644

restart-php5-fpm:
  cmd.run:
    - name: sudo service php5-fpm restart

xdebugconf:
  file.managed:
    - name: /etc/php5/fpm/conf.d/20-xdebug.ini
    - source: salt://php/files/xdebug.ini
    - template: jinja
    - makedirs: True
    - mode: 644

install-phpunit:
  cmd.run:
    - name: sudo wget https://phar.phpunit.de/phpunit.phar && sudo chmod +x phpunit.phar && sudo mv phpunit.phar /usr/local/bin/phpunit
    - unless: test -f /usr/local/bin/phpunit
    - cwd: {{ pillar["system"]["root_path"] }}

install-php-cs-fixer:
  cmd.run:
    - name: sudo wget http://get.sensiolabs.org/php-cs-fixer.phar -O php-cs-fixer && sudo chmod a+x php-cs-fixer && sudo mv php-cs-fixer /usr/local/bin/php-cs-fixer
    - unless: test -f /usr/local/bin/php-cs-fixer
    - cwd: {{ pillar["system"]["root_path"] }}