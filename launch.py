"""This script creates an EC2 instance based on supplied parameters."""
import time
import boto3
import click



@click.command()
@click.option('--type', default='t2.nano', help='Type of instance')
@click.option('--ami', default='ami-759bc50a', help='Base AMI')
@click.option('--project', default='cwc', help='Project name')
@click.option('--key', default='bgyori_ec2', help='Security key ID')
@click.option('--zone', default='us-east-1e', help='Availability zone')
@click.option('--secgroup', default='sg-392d664c', help='Security group')
@click.option('--volume', default=None, help='Attach EBS volume')
def launch(type, ami, project, key, zone, secgroup, volume):
    ec2 = boto3.resource('ec2')

    args = \
        {'InstanceType': type,
         'MinCount': 1,
         'MaxCount': 1,
         'ImageId': ami,
         'TagSpecifications': [{
             'ResourceType': 'instance',
             'Tags': [
                {'Key': 'project',
                 'Value': project}
                ]
            }],
         'KeyName': key,
         'Placement': {
             'AvailabilityZone': zone,
            },
        'SecurityGroupIds': [secgroup]
        }
    # Step 1 create the instance
    print('Instance launch initiated for instance of type %s' % type)
    instances = ec2.create_instances(**args)
    instance = instances[0]
    print('Instance assigned private IP: %s' % instance.private_ip_address)

    if volume:
        print('Attempting to attach volume %s to instance.' % volume)
        # Step 2 wait for the instance to come online
        time.sleep(30)
        instance.attach_volume(VolumeId=volume, Device='/dev/sdy')

    return instance

if __name__ == '__main__':
    launch()

# Step 3: do this in your terminal
# ssh -i <your RSA private key> ubuntu@<the public IP of the instance>
