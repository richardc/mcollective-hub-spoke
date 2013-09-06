#!ruby

require 'json'

path = File.dirname(__FILE__)
data = JSON.parse(IO.read("#{path}/data/common.json"))

BROKERS = data["spoke_demo::brokers"].to_i
NODES = data["spoke_demo::nodes"].to_i
NETWORK = data["spoke_demo::network"]
DOMAIN = data["spoke_demo::domain"]

Vagrant.configure("2") do |config|
  config.vm.box = "centos-64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.options = "--hiera_config /vagrant/hiera.yaml"
  end

  config.vm.define :hub do |hub|
    hub.vm.hostname = "hub.#{DOMAIN}"
    hub.vm.network :private_network, ip: "#{NETWORK}.10"
  end

  BROKERS.times do |i|
    config.vm.define "broker#{i}" do |broker|
      broker.vm.hostname = "broker#{i}.#{DOMAIN}"
      broker.vm.network :private_network, ip: "#{NETWORK}.#{50 + i}"
    end
  end

  NODES.times do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}.example.com"
      node.vm.network :private_network, ip: "#{NETWORK}.#{100 + i}"
    end
  end
end
