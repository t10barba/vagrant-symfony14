# -*- mode: ruby -*-
# vi: set ft=ruby :

personalization = File.expand_path("../Personalization", __FILE__)
load personalization

Vagrant::Config.run do |config|

  config.vm.box = $base_box

  config.vm.customize [
    "modifyvm", :id,
    "--memory", $mv_memory,
    "--name", $mv_name
  ]

  config.vm.host_name = $vhost + ".dev"

  config.vm.network :hostonly, $ip
  # Para Mac "en0: Ethernet" cambiar para otro OS
  # config.vm.network :bridged, :bridge => "en0: Ethernet"

  # Relative path
  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  # Absolute path
  config.vm.share_folder("v-root", "/vagrant", $local_path, :nfs => true)

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "00-app.pp"
  end

end
