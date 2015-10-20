install:
  cmd.run:
    - name: sudo curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony && sudo chmod a+x /usr/local/bin/symfony
    - unless: test -f /usr/local/bin/symfony
    - cwd: /root/