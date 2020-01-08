# -*- mode: ruby -*-

Vagrant.require_version ">= 1.8.1"

Vagrant.configure("2") do |config|

  config.vm.box = "packer/centos7"
  config.vm.box_url = "target/CentOS-7.box"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "CentOS-7"
    vb.cpus = "2"
    vb.memory = "2048"
    vb.gui = false
  end
  config.vm.synced_folder "../../src/", "/home/vagrant/src"
  config.vm.provision "shell", path: "../src/provision.sh", privileged: false

end
