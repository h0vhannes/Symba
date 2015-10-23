libapache2-mod-php5:
  pkg:
    - installed
    - skip_verify: True

apache2:
  pkg:
    - installed
    - skip_verify: True
  service.running:
    - enable: True
    - require:
      - pkg: apache2
      - pkg: libapache2-mod-php5

default-apache:
  file.absent:
    - name: /etc/apache2/sites-enabled/default
    - require:
      - pkg: apache2

apacheconf:
  file.managed:
    - name: /etc/apache2/sites-enabled/default
    - source: salt://apache/files/apache.conf
    - template: jinja
    - makedirs: True
    - mode: 755