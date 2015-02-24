# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.synced_folder "src/", "/data"
  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443 
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get -y install putty git zsh
    puttygen /vagrant/.vagrant/machines/default/virtualbox/private_key -o /vagrant/.vagrant/machines/default/virtualbox/private_key.ppk
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0BzxnxE_EM8nldUhxeWcybVRMbzg' -O /vagrant/tools/kitty.exe
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0BzxnxE_EM8nlY0tpcEZWSXM2a1k' -O /vagrant/tools/klink.exe
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    cp /vagrant/{.vimrc,.tmux.conf,.zshrc} /home/vagrant/
    sudo chsh -s /bin/zsh vagrant
  SHELL
end
