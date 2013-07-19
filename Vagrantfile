Vagrant.configure("2") do |config|
  config.vm.define :puppetagent22 do |cfg|
    cfg.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"
    cfg.vm.box = "Centos64"
    cfg.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: false
    cfg.vm.provision :shell, :inline => "echo foo > /tmp/test"
    #cfg.vm.provision :puppet_server do |puppet|
    #puppet.puppet_server = "puppet.endeavourdemo.com"
    # puppet.options = "--test --no-noop --pluginsync --debug --trace --environment=master"
    #puppet.facter = { "node_role" => "endeavour-standalone", "platform_domain" => "endeavourdemo.com", "node_profile" => "stable", "envname" => "ryantest012", "env_type" => "development",
    #                    "env_profile" => "bronze" }
  end
end
