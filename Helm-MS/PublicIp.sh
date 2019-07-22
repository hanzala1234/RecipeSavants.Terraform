#!/bin/bash

# Public IP address of your ingress controller
IP="52.173.193.144"

# Name to associate with public IP address
DNSNAME="recipesavants-efk-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with DNS name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
