#!ruby

VAGRANTFILE_API_VERSION = "2"
BROKERS = 2
NODES = 2
NETWORK = '192.168.19'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end

  config.vm.define :hub do |hub|
    hub.vm.hostname = 'hub.example.com'
    hub.vm.network :private_network, ip: "#{NETWORK}.10"
  end

  BROKERS.times do |i|
    config.vm.define "broker#{i}" do |broker|
      broker.vm.hostname = "broker#{i}.example.com"
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
