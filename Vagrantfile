# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "terrywang/archlinux"
  config.vm.provision "shell", privileged: false, inline: <<-SHELL
  	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm putty p7zip
	puttygen /vagrant/.vagrant/machines/default/virtualbox/private_key -o /vagrant/.vagrant/machines/default/virtualbox/private_key.ppk
	wget http://chocolatey.org/api/v2/package/kitty.portable/0.63.2.1 -O temp.zip; 7z x temp.zip tools/kitty.exe -o/vagrant; rm temp.zip
  cp /vagrant/.vimrc /home/vagrant/.vimrc
  SHELL
end
