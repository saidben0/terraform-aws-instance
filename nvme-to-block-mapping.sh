#!/usr/bin/env bash

device_names=(${devnames})

for i in `seq 0 26`; do
    nvme_block_device="/dev/nvme$${i}n1"

    # skip any nvme paths which don't exist.
    if [ -e  $nvme_block_device ]; then

        # get ebs block mapping device path set by stacker (or base AMI).
        mapping_device="$${device_names[i]}"

        # if the mapping_device is empty, it isn't an EBS device so
        # we will use the non_ebs_mapping to translate the device.
        if [[ -z "$mapping_device" ]]; then
            mapping_device="$${device_names[i]}"
        fi

        # if block mapping device path does not start with /dev/ fix it.
        if [[ "$mapping_device" != /dev/* ]]; then
            mapping_device="/dev/$${mapping_device}"
        fi

        # if the block mapping device path already exists, skip it.
        if [ -e $mapping_device ]; then
            echo "path exists: $${mapping_device}"

        # otherwise, create a symlink from nvme block device to mapping device.
        else
            ln -s $nvme_block_device $mapping_device
            echo "symlink created: $${nvme_block_device} to $${mapping_device}"
        fi
    fi
done
