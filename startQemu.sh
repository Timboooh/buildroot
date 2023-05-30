export PATH=$PATH:'/mnt/c/Program Files/qemu'

echo Copying files
cp -r ./output/images/* /mnt/c/Users/timov/Documents/Projects/qemu/
cd /mnt/c/Users/timov/Documents/Projects/qemu/

echo Starting Qemu
qemu-system-x86_64.exe -M pc -kernel bzImage -drive file=rootfs.ext2,if=virtio,format=raw -append "rootwait root=/dev/vda console=tty1 console=ttyS0"  -net nic,model=virtio -net user -serial stdio
