local:
  '*':
    - php
    - composer
    - symfony
    - nginx
    - redis
    - website
    - mysql

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