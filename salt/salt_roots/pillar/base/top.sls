local:
  '*':
    - nginx
    - mysql
    - website
    - parameters

dev:
  '*':
    - git
    - nginx
    - mysql
    - website
    - parameters

prod:
  '*':
    - git
    - nginx
    - mysql
    - website
    - parameters