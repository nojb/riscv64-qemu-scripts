#!/bin/bash

# To get a list of available images, you can do:
#
#   virt-builder --list | grep riscv64
#
# Currently the latest available image is `fedora-rawhide-developer-20200108.n.0`.

virt-builder \
  --arch riscv64 \
  --size 20G \
  --format raw \
  --output Fedora-Developer-Rawhide-20200108.n.0-sda.raw \
  fedora-rawhide-developer-20200108.n.0

# Can get a list of available firmware with
#
#   virt-builder --arch riscv64 --notes fedora-rawhide-developer-20200108.n.0 | grep fw_payload
#

wget https://dl.fedoraproject.org/pub/alt/risc-v/repo/virt-builder-images/images/Fedora-Developer-Rawhide-20200108.n.0-fw_payload-uboot-qemu-virt-smode.elf

