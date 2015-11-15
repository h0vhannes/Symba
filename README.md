Symfony-Vagrant Boilerplate
===

A minimal Symfony boilerplate that uses [Vagrant](https://www.vagrantup.com/downloads.html) and [SaltStack](http://saltstack.com/). Symba saves your time by solving 2 important problems
* Standardized dev, test and prod environment setup
* Automatic deployment and update of your project

On local machines Symba uses Vagrant to create a virtual machine and run Symfony project in a separated environment. On production or test servers Vagrant is not used.
For provisioning Symba uses SaltStack.

Software installed by Symba
===
By default Symba installs the following software

* <a href="http://php.net/ChangeLog-5.php#5.6.14" target="_blank">PHP 5.6</a>
* <a href="https://dev.mysql.com/downloads/mysql/5.5.html" target="_blank">Mysql 5.5</a>
* <a href="https://httpd.apache.org/" target="_blank">Apache2</a>
* <a href="https://getcomposer.org/" target="_blank">Composer (globally)</a>
* <a href="https://github.com/symfony/symfony-installer" target="_blank">Symfony installer (globally)</a>
* <a href="https://phpunit.de/" target="_blank">PHPUnit (globally)</a>
* <a href="https://github.com/FriendsOfPHP/PHP-CS-Fixer" target="_blank">PHP-CS-Fixer (globally)</a>

Requirements
===
* Symba runs on Ubuntu 14.04 LTS. Prod/Test servers should run Ubuntu, for virtual machines Vagrant automatically installs the right box.

Preparations
===
For local development you need [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

You can proceed to project setup once you have both installed on your machine.

Setup (Local Machine)
===

* Download <a href="https://github.com/araratpoghosyan/Symba/archive/master.zip" target="_blank">Zip Archive</a> and unzip it.
* Open Vagrantfile and change the value of **config.vm.hostname** (symba) to your project name, ex. **config.vm.hostname = "symfony-project"**.
* Copy salt/pillar/config.sls.dist file to salt/pillar/config.sls. Salt configuration is kept here. Modify it for your needs.
* Copy salt/salt/apache/files/apache.conf.dist to salt/salt/apache/files/apache.conf. This is your apache host configuration file. Change server_name to your project domain name, ex ```server_name symfony-project.dev;```
* Edit your hosts file and add this line at the bottom ```192.168.10.10 symfony-project.dev```. If you need more info on editing hosts file see this <a href="http://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/" target="_blank">link</a>.
* Open **terminal** (on Mac) or **cmd** (on Windows) and change your working directory to the unzipped folder.
* Run ```vagrant up``` to run the virtual machine
* Run ```vagrant ssh``` to login to your vm over SSH
* Run ```cd /var/www```
* Run ```sudo sh salt/scripts/install.sh``` to install Salt Minion
* Run ```sudo sh scripts/provision.sh``` to run Salt states

**After these steps you will have a running server with all its requirements set up.**

### Project Setup
If you closed your ssh session, ```cd``` to yout project directory and run ```vagrant ssh``` again.

**Symba does not have a preinstalled Symfony application.** You should create it in your /var/www directory. The easiest way to do it is to run these commands.

```symfony new /var/www/tmp```

```rm -f /var/www/tmp/.gitignore && rm -f /var/www/tmp/README.md```

```mv /var/www/tmp/* /var/www && rm -rf /var/www/tmp```

Notice that Symfony installer will thow an error if you try to install a project in a 'not empty' directory. 

So, here we go! Now, you can open <a href="http://symfony-project.dev" target="_blank">http://symfony-project.dev</a> in your browser and if the nice Symfony welcome screen appears then setup was successful, congrats!

Setup (Remote Server)
===

* SSH to your server.
* ```cd /var/www```
* Clone your project from repository ```git clone git@github.com:username/project.git .```.
* Checkout your working branch ```git checkout master|dev```.
* Pull ```git pull```
* Copy salt/pillar/config.sls.dist file to salt/pillar/config.sls. Salt configuration is kept here. Modify it for your needs.
* Copy salt/salt/apache/files/apache.conf.dist to salt/salt/apache/files/apache.conf. This is your apache host configuration file. Change server_name to your actual domain name, ex ```server_name symfony-www.example.com example.com;```
* Run ```sudo sh salt/scripts/install.sh``` to install Salt Minion.
* Run ```sudo sh scripts/provision.sh``` to run salt states.

**After these steps you will have a running server with all its requirements set up.**

Restart the server ```sudo reboot```

That's it. Now you can access your project via domain name.

Update Server
===

Everytime you want to update your project from SVC just run ```sudo sh /var/www/scripts/update.sh```. It automaticaly pulls your project and run deployment commands. You are free to make changes in this script and extend your updating functionality.

Important
===
* Symba assumes that you have only **one project** on a **single server**. Of course you can change that as you want, to fit your requirements.
* Do not execute update.sh script on your local machine, it can accidentally revert all your changes. 
