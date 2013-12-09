# -*- mode: ruby -*-
# vi: set ft=ruby :

personalization = File.expand_path("../Personalization", __FILE__)
load personalization

Vagrant.configure("2") do |config|
  config.vm.box = $base_box
  config.vm.box_url = "http://files.vagrantup.com/"+$base_box+".box"
  config.vm.provider "virtualbox" do |vb|
    vb.name = $vhost + ".dev"
    vb.customize ["modifyvm", :id, "--memory", $mv_memory, "--name", $mv_name, "--cpuexecutioncap", "50"]
  end
  config.vm.network "private_network", ip: $ip
  config.vm.network "public_network", :bridge => 'en0: Ethernet'
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]
  config.vm.synced_folder $local_path, "/vagrant", :mount_options => ["dmode=777","fmode=777"]
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "00-app.pp"
  end
  config.vbguest.auto_update = true
  config.vbguest.auto_reboot = true
end
