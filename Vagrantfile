# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/xenial64"
    ubuntu.vm.provision :shell, path: "provisions/ubuntu.sh"
    ubuntu.vm.network :private_network, type: :static, ip: "192.168.50.240"
  end

  config.vm.define "rhel7" do |rhel7|
    # rhel7.gui = true
    rhel7.vm.box = "generic/rhel7"
    rhel7.vm.provision :shell, path: "provisions/rhel7.sh"
    rhel7.vm.network :private_network, type: :static, ip: "192.168.50.241"
  end

  config.ssh.insert_key = 'true'

  config.ssh.forward_agent = true

  config.vm.synced_folder ENV['GOPATH'], "/go"
end
