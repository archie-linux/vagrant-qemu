#!/bin/bash

# Base configuration
VM_PREFIX="my-vm"
NUM_VMS=3  # Number of VMs to create
MEMORY=2048
VCPUS=2
OS_VARIANT="ubuntu20.04"  # Adjust as needed
DISK_PATH="/Users/anish/.vagrant.d/boxes/perk-VAGRANTSLASH-ubuntu-2204-arm64/20230712/arm64/libvirt/box.img"

# # Create multiple VMs
for i in $(seq 1 $NUM_VMS); do
    VM_NAME="${VM_PREFIX}-${i}"
    BASE_IMAGE="base-ubuntu-${i}.qcow2"

    # Create a backing file for this VM
    echo "Creating disk for ${VM_NAME}..."
    qemu-img create -f qcow2 -b $DISK_PATH -F qcow2 $BASE_IMAGE

    # Create the VM using virt-install
    virt-install \
    --name "$VM_NAME" \
    --memory "$MEMORY" \
    --vcpus "$VCPUS" \
    --disk path="$BASE_IMAGE",format=qcow2 \
    --import \
    --os-variant "$OS_VARIANT" \
    --network type=default \
    --noautoconsole
done
