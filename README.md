Run this scrpt to launch an EC2 instance.

Example
```
python launch.py --type=t2.nano
```

General usage
-------------
```
Usage: launch.py [OPTIONS]

Options:
  --type TEXT      Type of instance
  --ami TEXT       Base AMI
  --project TEXT   Project name
  --key TEXT       Security key ID
  --zone TEXT      Availability zone
  --secgroup TEXT  Security group
  --volume TEXT    Attach EBS volume
  --help           Show this message and exit.
```

Attaching a volume to an instance
---------------------------------
When attaching a volume, after logging in, do `lsblk` to find the device name
of the volume e.g. nvme1n1. If the volume has not yet been formatted, do
```
sudo mkfs -t ext4 /dev/nvme1n1
```
then make a folder to mount the volume in and mount it as
``` 
sudo mkdir /data
sudo mount /dev/nvme1n1 /data/
```
Once you have the new disk mounted, it makes sense to chown it to the user as
```
sudo chown ubuntu /data/
```
