#!/bin/bash

export AWS_DEFAULT_REGION=us-east-1

instanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

aws autoscaling update-auto-scaling-group --auto-scaling-group-name infra-LinuxWebASG-ITOLA6S7M7ZQ --health-check-type EC2

aws elb deregister-instance-from-load-balancer --load-balancer-name LinuxWebELB --instances $instanceID

# Give instance time to get removed from ELB (User should not see blank page)
sleep 60