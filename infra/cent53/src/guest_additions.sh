#!/usr/bin/env bash

KERN_DIR=/usr/src/kernels/`uname -r`
export KERN_DIR
export MAKE='/usr/bin/gmake -i'
export MOUNT_POINT=/mnt/iso

# Mount the disk image
sudo mkdir -p ${MOUNT_POINT}
sudo mount -t iso9660 -o loop VBoxGuestAdditions.iso ${MOUNT_POINT}

# Install the drivers
sudo ${MOUNT_POINT}/VBoxLinuxAdditions.run --nox11

# Cleanup
sudo umount ${MOUNT_POINT}
sudo rmdir ${MOUNT_POINT}
#rm -rf isomount VBoxGuestAdditions.iso
