get-symfony:
  cmd.run:
    - name: "sudo curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony"
    - unless: test -f /usr/local/bin/symfony
    - cwd: /root/

install-symfony:
  cmd.wait:
    - name: sudo chmod a+x /usr/local/bin/symfony
    - watch:
      - cmd: get-symfony