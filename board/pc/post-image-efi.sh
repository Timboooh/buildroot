#!/bin/sh

set -e
set -x

# UUID=$(dumpe2fs "$BINARIES_DIR/rootfs.ext2" 2>/dev/null | sed -n 's/^Filesystem UUID: *\(.*\)/\1/p')
# sed -i "s/UUID_TMP/$UUID/g" "$BINARIES_DIR/efi-part/EFI/BOOT/grub.cfg"
BZIMAGE_SIZE=$(stat --format='%s' "$BINARIES_DIR/bzImage")
BZIMAGE_SIZE=$(($BZIMAGE_SIZE+65536))
sed "s/BZIMAGE_SIZE/$BZIMAGE_SIZE/g" board/pc/genimage-efi.cfg > "$BINARIES_DIR/genimage-efi.cfg"

# cp board/pc/genimage-efi.cfg "$BINARIES_DIR/genimage-efi.cfg"

support/scripts/genimage.sh -c "$BINARIES_DIR/genimage-efi.cfg"
fdisk -lu "$BINARIES_DIR/disk.img"