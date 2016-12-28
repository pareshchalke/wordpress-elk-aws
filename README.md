# wordpress-elk-aws
Ansible playbook to spin a new instance, Docker file to setup ELK and Wordpress

Clone the repo on a machine which has internet connectivity and ansible installed (recommended 2.2.0.0 - tested )

Add aws details in details-aws.yml
---
ACCESS_KEY: "XXXXXXXXXXXXXXXXXX"
SECRET_KEY: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
KEY_PAIR: "KEY-NAME"
AMI_ID: "AMI_ID"
SUBNET_ID: "SUBNET_ID"

Use ansible playbook command to spin up an instance ( t2.large ) on your aws account region us-east-1.
#ansible-playbook spinup-aws-instance.yml

This will add a host entry in file new-host

Next enter the ansible-playbook command to create ELK stack on docker and Wordpress on docker.
#ansible-playbook configure-machine.yml -i new-host

Now you can access the ELK stack on http://IP_ADDRES:8080
and the wordpress website on http://IP_ADDRESS
