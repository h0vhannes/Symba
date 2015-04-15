redis-server:
  pkg.installed

redis_conf:
  file:
    - managed
    - name: /etc/redis/redis.conf
    - source: salt://redis/redis.conf
    - template: jinja