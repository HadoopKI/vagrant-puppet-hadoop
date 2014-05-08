# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    config.vm.box = "centos65-pupet-chef-vboxadd"

    config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140311.box"
    config.vm.box_download_checksum = "7fcb33945b790dccfdb845e127bf98bd9f082282f36e9cec629d88ed6aa5a8a4"
    config.vm.box_download_checksum_type = "sha256" 

    vb.gui = false
    vb.name = "TestHKI"
    vb.memory = 512
    vb.cpus = 2
  end

  config.vm.hostname= "testhki"
  #config.vm.network "public_network"
  config.vm.network "private_network", ip: "192.168.22.22"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.synced_folder "./", "/vagrant"

  config.vm.provision "puppet" do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.manifest_file  = "testhki.pp"
  end

end
