install-phpunit:
  cmd.run:
    - name: sudo wget https://phar.phpunit.de/phpunit.phar && sudo chmod +x phpunit.phar && sudo mv phpunit.phar /usr/local/bin/phpunit
    - unless: test -f /usr/local/bin/phpunit
    - cwd: /root/