# -*- mode: ruby -*-
# vi: set ft=ruby :
#
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", ip: "192.168.50.10"

  config.vm.synced_folder "../st2", "/home/ubuntu/st2", type: "rsync", rsync__exclude: [".git/", "virtualenv/"]
  config.vm.synced_folder "../st2web", "/home/ubuntu/st2web", type: "rsync", rsync__exclude: ["node_modules", "config.js", "npm-debug.log", "node_modules", "components", "css", "js", "build", "discs"]
  config.vm.synced_folder "../st2flow", "/home/ubuntu/st2flow", type: "rsync", rsync__exclude: ["node_modules"]
  config.vm.synced_folder "../mistral", "/home/ubuntu/mistral", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder "../st2mistral", "/home/ubuntu/st2mistral", type: "rsync", rsync__exclude: ".git/"
  config.vm.synced_folder "./include/packs/test", "/opt/stackstorm/packs/test", type: "rsync", rsync__exclude: ".git/"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.provision "shell", path: "./include/prov.sh"
end
