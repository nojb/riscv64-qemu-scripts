#!/bin/bash

# Assumes qemu-system-riscv64 is in PATH, and that the Fedora disk image & firmware
# are in the current directory, adjust as needed.

QEMU=qemu-system-riscv64
KERNEL=Fedora-Developer-Rawhide-*-fw_payload-uboot-qemu-virt-smode.elf
IMAGE=Fedora-Developer-Rawhide-*.raw

$QEMU \
  -nographic \
  -machine virt \
  -smp 8 \
  -m 2G \
  -kernel $KERNEL \
  -object rng-random,filename=/dev/urandom,id=rng0 \
  -device virtio-rng-device,rng=rng0 \
  -device virtio-blk-device,drive=hd0 \
  -drive file=$IMAGE,format=raw,id=hd0 \
  -device virtio-net-device,netdev=usernet \
  -netdev user,id=usernet,hostfwd=tcp::10000-:22

# Once the machine has booted, you can ssh into the machine by doing
#
#  ssh -p 10000 riscv@localhost
#
# The password is `fedora_rocks!` (also the password for `root`, but you cannot
# ssh directly as `root`.
