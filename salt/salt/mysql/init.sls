mysql-client-5.5:
  pkg.installed

mysql-server-5.5:
  pkg.installed

python-mysqldb:
  pkg.installed

mysql-service:
  service.running:
    - name: mysql
    - require:
      - pkg: mysql-server-5.5
      - pkg: python-mysqldb

mysql-base:
  mysql_database.present:
    - name: {{ pillar["mysql"]["database"] }}
    - character_set: utf8
    - require:
      - service: mysql

mysql-user:
  mysql_user.present:
    - name: {{ pillar["mysql"]["user"] }}
    - password: {{ pillar["mysql"]["password"] }}
    - require:
      - service: mysql

mysql-grants:
  mysql_grants.present:
    - database: {{ pillar["mysql"]["database"] }}.*
    - grant: ALL PRIVILEGES
    - user: {{ pillar["mysql"]["user"] }}