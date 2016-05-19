vagrant-meanio
==============
A pre-built and initialised MEAN (http://mean.io) app server for development with Vagrantfile.

### Example Vagrantfile:
    VAGRANTFILE_API_VERSION = "2"
    Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
      config.vm.define "meanproj", primary: true do |meanproj|
        meanproj.vm.synced_folder "src/", "/home/vagrant/appserver/packages/custom"
        meanproj.vm.provider "docker" do |d|
          d.image = "gbevan/vagrant-meanio:devel"
          d.has_ssh = true
          d.ports = ["3000:3000", "3443:3443"]
        end
      end
    end

Maps your project's src/ folder to ```appserver/packages/custom```.

### Run:
    $ vagrant up --provider=docker

### Tags:

* latest - currently still maps to the 12 month old version with v0.4.2 of mean.io

* devel - building from mean.io's master branch
