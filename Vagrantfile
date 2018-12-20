#-*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  # config.ssh.username = "mstone"

  # config.vm.allowed_synced_folder_types = [:rsync]

  config.vm.network "private_network", ip: "192.168.50.25"

  config.vm.provider "aws" do |aws, override|
    aws.tags = {
      'Name' => 'DevBox'
    }
    aws.associate_public_ip = true
    aws.instance_type = 't2.medium'
    aws.ami = 'ami-0ac019f4fcb7cb7e6'
    aws.subnet_id = 'subnet-3b642f5e'
    aws.keypair_name = 'mstone'
    aws.security_groups = ['sg-725fe838']

    override.ssh.username = 'ubuntu'
    override.ssh.private_key_path = '~/.ssh/mstone.pem'
  end

  config.vm.synced_folder "../st2", "/home/vagrant/st2"
  config.vm.synced_folder "../st2", "/home/vagrant/local/st2", type: "rsync", rsync__exclude: ["virtualenv/"]

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 16384
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: "sudo apt-get update; sudo apt-get -y install python python-setuptools"

  config.vm.provision "ansible" do |ansible|
    ansible.config_file = "~/dev/dots/ansible/config.cfg"
    ansible.playbook = "main.yml"
  end
end
