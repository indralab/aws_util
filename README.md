Run this script to launch an EC2 instance.

Example
```
python launch.py --type=t2.nano
```

General usage
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
