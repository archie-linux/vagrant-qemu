Vagrant.configure("2") do |config|
  config.vm.box = "perk/ubuntu-2204-arm64"

  config.vm.provider "qemu" do |qemu|
    qemu.memory = "2048"
    qemu.cpus = 2
  end
end

