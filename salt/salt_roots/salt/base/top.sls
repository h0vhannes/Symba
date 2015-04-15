local:
  '*':
    - php
    - composer
    - symfony
    - nginx
    - redis
#    - mysql.server

dev:
  '*':
    - git
    - redis
    - nginx
    - cron

prod:
  '*':
    - git
    - redis
    - nginx
    - cron