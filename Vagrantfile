Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vbguest.auto_update = false
  config.vm.boot_timeout = 600
  config.ssh.insert_key = false

  config.vm.define "web1" do |web1|
    web1.vm.hostname = "web1"
    web1.vm.network "private_network", ip: "192.168.56.10"
    web1.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    web1.vm.provision "shell", path: "scripts/setup_web.sh"
  end

  config.vm.define "web2" do |web2|
    web2.vm.hostname = "web2"
    web2.vm.network "private_network", ip: "192.168.56.11"
    web2.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    web2.vm.provision "shell", path: "scripts/setup_web.sh"
  end

  config.vm.define "web3" do |web3|
    web3.vm.hostname = "web3"
    web3.vm.network "private_network", ip: "192.168.56.13"
    web3.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    web3.vm.provision "shell", path: "scripts/setup_web.sh"
  end

  config.vm.define "lb" do |lb|
    lb.vm.hostname = "lb"
    lb.vm.network "private_network", ip: "192.168.56.12"
    lb.vm.network "forwarded_port", guest: 80, host: 8080
    lb.vm.provider "virtualbox" do |vb|
      vb.memory = "512"
      vb.cpus = 1
    end
    lb.vm.provision "shell", path: "scripts/setup_lb.sh"
  end
end