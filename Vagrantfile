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
    end
  end

  # Virtual box config to go in here. 
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = true
    # vb.customize ["modifyvm", :id, "--memory", node[:ram].to_s, "--name", node[:hostname]]
  end

  # place in the hiera config
  config.vm.provision :shell, :inline => "ln -s /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml"
  config.vm.provision :shell, :inline => "ln -s /vagrant/puppet/hiera /etc/puppet/hiera"

  # Do the puppet run on the server. 
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end
 
  # Reboot the host so it comes back as runlevel 5
  config.vm.provision :shell, :inline => "reboot"

end
