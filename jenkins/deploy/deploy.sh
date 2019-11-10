#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $PASS >> /tmp/.auth

scp -i /root/.ssh/id_rsa /tmp/.auth prod-user@192.168.159.167:/tmp/.auth
scp -i /root/.ssh/id_rsa ./jenkins/deploy/publish.sh prod-user@192.168.159.167:/tmp/publish
ssh -i /root/.ssh/id_rsa prod-user@192.168.159.167 /tmp/publish
