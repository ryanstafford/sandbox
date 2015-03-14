# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.synced_folder "src/", "/src"
  config.vm.network "public_network"
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 443, host: 443 
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 35729, host: 35729
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    sudo sh -c "echo deb https://get.docker.com/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
    sudo apt-get update
    sudo apt-get -y install putty git zsh lxc-docker
    puttygen /vagrant/.vagrant/machines/default/virtualbox/private_key -o /vagrant/.vagrant/machines/default/virtualbox/private_key.ppk
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0BzxnxE_EM8nldUhxeWcybVRMbzg' -O /vagrant/tools/kitty.exe
    wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0BzxnxE_EM8nlY0tpcEZWSXM2a1k' -O /vagrant/tools/klink.exe
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    cp /vagrant/{.vimrc,.tmux.conf,.zshrc} /home/vagrant/
    sudo chsh -s /bin/zsh vagrant
    cd /vagrant/src
    sudo docker-compose up -d
     SHELL
end
