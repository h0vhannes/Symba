#-----------------------------------------------------------------------------------------------------------------------
#  Deployment
#-----------------------------------------------------------------------------------------------------------------------

deployment:
  parameters_path: /var/www/app/config/parameters.yml
  project_path: /var/www/


#-----------------------------------------------------------------------------------------------------------------------
#  Git
#-----------------------------------------------------------------------------------------------------------------------

git:
  repo_url: https://github.com/araratpoghosyan/symba.git
  branch: dev

#-----------------------------------------------------------------------------------------------------------------------
#  MySQL
#-----------------------------------------------------------------------------------------------------------------------

mysql:
  user: root
  password: password
  database: symba

#-----------------------------------------------------------------------------------------------------------------------
#  Nginx
#-----------------------------------------------------------------------------------------------------------------------

nginx:
  access_log_file: /var/log/nginx/access.log
  error_log_file: /var/log/nginx/error.log

#-----------------------------------------------------------------------------------------------------------------------
#  Symfony config parameters
#-----------------------------------------------------------------------------------------------------------------------

parameters:
  database_driver: pdo_mysql
  database_host: 127.0.0.1
  database_port: null
  database_name: symba
  database_user: root
  database_password: password

  mailer_transport: smtp
  mailer_host: 127.0.0.1
  mailer_user: null
  mailer_password: null
  locale: en
  secret: ThisTokenIsNotSoSecretChangeIt