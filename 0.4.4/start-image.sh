#!/bin/bash -e

echo `date` "Starting MongoDB"
/usr/bin/mongod --config /etc/mongod.conf --fork

echo `date` "Starting SSHD"
/usr/sbin/sshd -D -e
