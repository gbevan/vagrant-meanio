# Build:
#  docker build -t gbevan/vagrant-meanio .
#
# Example Vagrantfile:
#   VAGRANTFILE_API_VERSION = "2"
#   Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#     config.vm.define "slm.io", primary: true do |slmio|
#       slmio.vm.provision "shell", inline: '/usr/bin/mongod --config /etc/mongod.conf --fork'
#       slmio.vm.synced_folder "src/", "/home/vagrant/appserver/packages/custom"
#       slmio.vm.provider "docker" do |d|
#         d.image = "gbevan/vagrant-meanio:latest"
#         d.has_ssh = true
#       end
#     end
#   end
#
# Run:
#  vagrant up --provider=docker
#
# resolve dns issues:
# /etc/conf/docker
#  DOCKER_OPTS="--dns ip_1 --dns ip_2"
#

FROM ubuntu:latest
MAINTAINER Graham Bevan "graham.bevan@ntlworld.com"

ENV DEBIAN_FRONTEND noninteractive
ENV LANG=C
ENV LC_ALL=C

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y wget aptitude htop vim vim-puppet git traceroute dnsutils curl ssh sudo psmisc gcc make build-essential && \
    mkdir /var/run/sshd && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config && \
    useradd --create-home -s /bin/bash vagrant && \
    mkdir -p /home/vagrant/.ssh && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > /home/vagrant/.ssh/authorized_keys && \
    chown -R vagrant: /home/vagrant/.ssh && \
    echo -n 'vagrant:vagrant' | chpasswd && \
    touch /home/vagrant/.hushlogin && \
    mkdir -p /etc/sudoers.d && \
    echo "vagrant ALL= NOPASSWD: ALL" > /etc/sudoers.d/vagrant && \
    chmod 0440 /etc/sudoers.d/vagrant && \
    echo "set modeline" > /root/.vimrc && \
    echo "export TERM=vt100" >> /root/.bashrc && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org && \
    /usr/bin/mongod --config /etc/mongod.conf --fork && \
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    apt-get clean && \
    npm install -g grunt-cli && \
    npm install -g bower && \
    npm install -g mean-cli && \
    su - vagrant -c' echo -e "\n\n \n" | mean init appserver && cd appserver && npm install && mean install mean-admin' && \
    mongo mean-dev --eval "printjson(db.dropDatabase())" && \
    killall mongod; \
    rm -rf /var/lib/mongodb/*; \
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/sshd", "-D", "-e"]
EXPOSE 22
EXPOSE 3000