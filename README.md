Launching an EC2 instance
=========================

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

Generating a cost report by project tag
=======================================
The `get_costs.py` script generates a plot of AWS costs stratified by
project tag. By default, one week of costs are displayed with a separate line
for each project. The script assumes that a Slack token is available which
allows posting the image to a Slack channel.

Usage
```
python get_costs.py
```
