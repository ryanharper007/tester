domain   = 'example.com'

nodes = [
  { :hostname => 'tester',   :ip => '192.168.0.42', :box => 'Centos64', :box_url => 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box' },
]

Vagrant::configure("2") do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |node_config|
      node_config.vm.box = node[:box]
      node_config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: false
      node_config.vm.box_url = node[:box_url]      
      
      
     # memory = node[:ram] ? node[:ram] : 256;
     # node_config.vm.customize [
     #   'modifyvm', :id,
     #   '--name', node[:hostname],
     #   '--memory', memory.to_s
     # ]
    end
  end
  config.vm.provider :virtualbox do |vb|
     # Don't boot with headless mode
     vb.gui = true
    # vb.customize ["modifyvm", :id, "--memory", node[:ram].to_s, "--name", node[:hostname]]
   end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end

  config.vm.provision :shell, :inline => "reboot"

end









#Vagrant.configure("2") do |config|
#  config.vm.define :tester do |cfg|
#    cfg.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
#    cfg.vm.box = "Centos64"
#    cfg.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: false
#    cfg.vm.provision :shell, :inline => "echo foo > /tmp/test"
#    cfg.vm.provision :puppet_server do |puppet|
#    #puppet.puppet_server = "puppet.endeavourdemo.com"
#    # puppet.options = "--test --no-noop --pluginsync --debug --trace --environment=master"
#    #puppet.facter = { "node_role" => "endeavour-standalone", "platform_domain" => "endeavourdemo.com", "node_profile" => "stable", "envname" => "ryantest012", "env_type" => "development",
#    #                    "env_profile" => "bronze" }
#  end
#end
