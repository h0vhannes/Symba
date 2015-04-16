# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Vagrant box
  config.vm.box = "ubuntu/trusty64"

  # Network
  config.vm.network "private_network", ip: "192.168.10.10"

  # Shared
  config.vm.synced_folder ".", "/var/www", :nfs => true

  # Configure virtual host name
  config.vm.hostname = "symba"
end