# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.require_version '>= 1.6.3'

Vagrant.configure(2) do |config|
  config.vm.box = 'boxcutter/ubuntu1404'

  config.vm.provider 'parallels' do |v|
    v.update_guest_tools = true
    v.memory = 4096
    v.cpus = 4
  end

  config.vm.network 'private_network', ip: '192.168.33.10'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder '/Users/aurelienbottazini/projects', '/projects',
                          type: 'nfs'
  config.vm.synced_folder '/Users/aurelienbottazini/projects',
                          '/Users/aurelienbottazini/projects',
                          type: 'rsync',
                          rsync__exclude: ['.git/',
                                           'vendor/bundle',
                                           'vendor/ruby',
                                           'public/system',
                                           'log',
                                           'tmp'
                                           ]
  config.vm.provision 'shell', privileged: false,
                      path: 'Vagrantfile_shell_provision.sh'
end
