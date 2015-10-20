nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: nginx

default-nginx:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
    - require:
      - pkg: nginx

nginxconf:
  file.managed:
    - name: /etc/nginx/sites-enabled/default
    - source: salt://nginx/files/nginx.conf
    - template: jinja
    - makedirs: True
    - mode: 755