#!/bin/bash

for node in controller compute01 compute02
do
  j=1
  k=2
  for i in {a..d}
    do
      ceph-deploy osd create ${node} --data /dev/sd${i} --block-wal /dev/nvme0n1p${j} --block-db /dev/nvme0n1p${k}
      ((j=${j}+2))
      ((k=${k}+2))
      sleep 3
    done
done