#!/bin/bash

VAGRANT_BOX="perk/ubuntu-2204-arm64"
QEMU_DISK="ubuntu.qcow2"
BOX_IMAGE="/Users/anish/.vagrant.d/boxes/perk-VAGRANTSLASH-ubuntu-2204-arm64/20230712/arm64/libvirt/box.img"

# Ensure terminal settings are restored on exit
cleanup() {
    reset
    echo "Terminal restored"
}
trap cleanup EXIT  # Call cleanup function when script exits

# Step 3: Boot QEMU
qemu-system-aarch64 \
    -M virt \
    -m 2048 \
    -cpu cortex-a72 \
    -smp 2 \
    -drive file=$BOX_IMAGE,format=qcow2,if=virtio \
    -nographic
