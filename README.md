Symfony-Vagrant Boilerplate
===

A minimal Symfony boilerplate that uses Vagrant and SaltStack. It has something that will help you do some stuff.

What will be installed
===
* <a href="http://php.net/ChangeLog-5.php#5.6.14" target="_blank">PHP 5.6</a>
* <a href="https://dev.mysql.com/downloads/mysql/5.5.html" target="_blank">Mysql 5.5</a>
* <a href="https://httpd.apache.org/" target="_blank">Apache2</a>
* <a href="https://getcomposer.org/" target="_blank">Composer (globally)</a>
* <a href="https://github.com/symfony/symfony-installer" target="_blank">Symfony installer (globally)</a>
* <a href="https://phpunit.de/" target="_blank">PHPUnit (globally)</a>
* <a href="https://github.com/FriendsOfPHP/PHP-CS-Fixer" target="_blank">PHP-CS-Fixer (globally)</a>

Requirements
===
* Your server must run on Ubuntu 14.04 LTS

Preparations
===
For local development you will need [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed on your machine.

install these requirements and continue

Setup (Local Machine)
===

* Download <a href="https://github.com/araratpoghosyan/Symba/archive/master.zip" target="_blank">Zip Archive</a> and unzip it.
* Open Vagrantfile with text editor and change **config.vm.hostname** value (symba) to your project name, ex. **config.vm.hostname = "symfony-project"**.
* Copy salt/pillar/config.sls.dist file to salt/pillar/config.sls. Here you can specify all your configurations that will affect your installation.
* Copy salt/salt/apache/files/apache.conf.dist to salt/salt/apache/files/apache.conf. This will be your apache host configuration file. Change server_name to your project domain name, ex ```server_name symfony-project.dev;```
* Edit your hosts file and add this line at the bottom ```192.168.10.10 symfony-project.dev```. If you don't know how to edit hosts file please follow <a href="http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/" target="_blank">this</a> link.
* Open **terminal** (on Mac) or **cmd** (on Windows) and change your working directory to unzipped folder.
* Run ```vagrant up```
* Run ```vagrant ssh``` to login to your vm over SSH
* Run ```cd /var/www```
* Run ```sudo sh salt/scripts/install.sh``` to install Salt Minion
* Run ```sudo sh scripts/provision.sh``` to run salt states

**After this steps you will have server with all its requirements.**

### Project Setup
If you closed your ssh session, ```cd``` to yout project directory and run ```vagrant up``` again.

**Symba does not have Symfony application preinstalled.** You must create it in your /var/www directory. But symfony installer will thow an error when you try to install project in 'not empty' directory. The easyest way to do it, is to run these commands.

```symfony new /var/www/tmp```

```rm -f /var/www/tmp/.gitignore && rm -f /var/www/tmp/README.md```

```mv /var/www/tmp/* /var/www && rm -rf /var/www/tmp```

Here we go! Now you can open <a href="http://symfony-project.dev" target="_blank">http://symfony-project.dev</a> in your browser and if you see nice Symfony welcome screen, it means that setup was successful, congrats!

Setup (Remote Server)
===

* SSH to your server.
* ```cd /var/www```
* Clone your project from repository ```git clone git@github.com:username/project.git .```.
* Checkout your working branch ```git checkout master|dev```.
* Pull ```git pull```
* Copy salt/pillar/config.sls.dist file to salt/pillar/config.sls. Here you can specify all your configurations that will affect your installation.
* Copy salt/salt/apache/files/apache.conf.dist to salt/salt/apache/files/apache.conf. This will be your apache host configuration file. Change server_name to your actual domain name, ex ```server_name symfony-www.example.com example.com;```
* Run ```sudo sh salt/scripts/install.sh``` to install Salt Minion.
* Run ```sudo sh scripts/provision.sh``` to run salt states.

**After this steps you will have server with all its requirements.**

Restart server ```sudo reboot```

Thats it. Now you can access your project via domain name.

Update Server
===

Everytime you want to update your project from SVC just run ```sudo sh scripts/update.sh```. It will automaticaly pull your project and run deployment commands. You are free to make changes in this script to extend update functionality.

Important
===
* Symba assumes that you have only **one project** on a **single server**. Of course you can change it as you want, to fit your requirements.
* Do not execute update.sh script on your local machine, id can accidentally revert all your changes. 