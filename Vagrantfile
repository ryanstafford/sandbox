# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y install putty
    puttygen /vagrant/.vagrant/machines/default/virtualbox/private_key -o /vagrant/.vagrant/machines/default/virtualbox/private_key.ppk
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0BzxnxE_EM8nldUhxeWcybVRMbzg' -O /vagrant/tools/kitty.exe
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0BzxnxE_EM8nlY0tpcEZWSXM2a1k' -O /vagrant/tools/klink.exe
    cp /vagrant/.vimrc /home/vagrant/.vimrc
  SHELL
end
