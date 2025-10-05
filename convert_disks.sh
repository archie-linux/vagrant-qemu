#!/bin/bash

# Define the base directory for Vagrant boxes
BOXES_DIR="$HOME/.vagrant.d/boxes"

# Find disk files inside libvirt directories
find "$BOXES_DIR" -type f -path "*/libvirt/*" \( -name "*.vmdk" -o -name "*.qcow2" -o -name "*.img" \) | while read -r disk_file; do
    # Get file extension
    extension="${disk_file##*.}"

    # Determine if the file is already QCOW2
    if qemu-img info "$disk_file" | grep -q "file format: qcow2"; then
        echo "Skipping QCOW2 file: $disk_file"
        continue
    fi

    # Define output filename
    output_file="${disk_file%.*}.qcow2"

    # Convert based on file type
    case "$extension" in
        vmdk)
            echo "Converting VMDK to QCOW2: $disk_file -> $output_file"
            qemu-img convert -f vmdk -O qcow2 "$disk_file" "$output_file"
            ;;
        img)
            echo "Converting RAW IMG to QCOW2: $disk_file -> $output_file"
            qemu-img convert -f raw -O qcow2 "$disk_file" "$output_file"
            ;;
        *)
            echo "Unknown format: $disk_file (Skipping)"
            ;;
    esac
done


# find ~/.vagrant.d/boxes -type f -path "*/libvirt/*" \( -name "*.vmdk" -o -name "*.qcow2" -o -name "*.img" \) -exec file {} \;
# find ~/.vagrant.d/boxes -type f -path "*/libvirt/*" \( -name "*.vmdk" -o -name "*.qcow2" -o -name "*.img" \) -exec du -sh {} \;
# find ~/.vagrant.d/boxes -type f -path "*/libvirt/*" \( -name "*.vmdk" -o -name "*.qcow2" -o -name "*.img" \) \
# -exec sh -c 'qemu-img info "{}" | grep "file format: qcow2"' \; -print
