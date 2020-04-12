#!/bin/bash

export AWS_DEFAULT_REGION=us-east-1

instanceID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

aws autoscaling update-auto-scaling-group --auto-scaling-group-name infra-LinuxWebASG-ITOLA6S7M7ZQ --health-check-type ELB

aws elb register-instances-with-load-balancer --load-balancer-name LinuxWebELB --instances $instanceID
