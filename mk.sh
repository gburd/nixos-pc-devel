#!/run/current-system/sw/bin/bash

set -euxo pipefail

#for /dev/sd[a-e,g,h]; do 
for TGTDEV in /dev/sda; do
    
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # partition number 1
    # default - start at beginning of disk 
  +512M # 512 MB boot parttion
  n # new partition
  p # primary partition
  2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  a # make a partition bootable
  1 # bootable partition is partition 1 -- /dev/sda1
  t # set partition type
  fd # to Linux
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF

done
