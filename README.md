vagrant-meanio
==============
A pre-built and initialised MEAN (http://mean.io) app server for development with Vagrantfile.

### Example Vagrantfile:
    VAGRANTFILE_API_VERSION = "2"
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
        config.vm.define "slm.io", primary: true do |slmio|
            slmio.vm.provision "shell", inline: '/usr/bin/mongod --config /etc/mongod.conf --fork'
            slmio.vm.synced_folder "src/", "/home/vagrant/appserver/packages/custom"
            slmio.vm.provider "docker" do |d|
                d.image = "gbevan/vagrant-meanio:latest"
                d.has_ssh = true
            end
        end
    end
Maps your project's src/ folder to ```appserver/packages/custom```.

### Run:
    $ vagrant up --provider=docker
