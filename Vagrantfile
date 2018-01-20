#!/usr/bin/env ruby
# ^ Syntax hint
require 'ffi'

`ssh-add >> /dev/null 2>&1`

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "gsdev/centos-6-9-minimal-chef-12-6-0"

  config.vm.hostname = "chef-varnish"

  config.vm.provider "virtualbox" do |vb, overrides|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1024",
      "--cpus", "4",
      "--name", "chef-varnish"
    ]

    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

    # Network configuration
    overrides.vm.network :private_network, ip: "10.100.100.100"
    overrides.ssh.forward_agent = true
  end

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "varnish-centos"
  end

  config.vm.provision "shell", path: "vagrant/provision.sh"
end
