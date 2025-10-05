### Install Virt-Manager

- brew install --cask xquartz
- brew install virt-manager

### Install Vagrant and QEMU

- brew install vagrant
- brew install qemu
- vagrant plugin install vagrant-qemu

### Start the VM

- cd single-vm
- vagrant up
- vagrant ssh

### Vagrant Transfer File via SCP

- vagrant plugin install vagrant-scp
- vagrant scp /path/to/local/file :/home/vagrant/

### Vagrant Synced Folders

- config.vm.synced_folder "./shared_folder", "/home/vagrant/shared"

### Vagrant Multi-VM

- cd multi-vm
- vagrant up
- vagrant status
- vagrant ssh [vm1|vm2]

### Download Vagrant Boxes

- ./download_boxes.sh

### Convert the Disk Image

- ./convert_disks.sh
