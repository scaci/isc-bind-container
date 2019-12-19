#!/bin/bash
OPTIONS=$@

#Add Named user and group to manage volume
groupadd -g 25 named
adduser -u 25 -g 25 -d /var/named -c Named -s /sbin/nologin named

#Setting file permissions
chown root:named /etc/named.ca
chmod u=rw,g=wr,o= /etc/named.ca
chown root:named /etc/named.conf
chmod u=rw,g=wr,o= /etc/named.conf
chown root:named /etc/named.logging
chmod u=rw,g=wr,o= /etc/named.logging
chown root:named /etc/named.rfc1912.zones
chmod u=rw,g=wr,o= /etc/named.rfc1912.zones
chown root:named /etc/named.root.key
chmod u=rw,g=wr,o= /etc/named.root.key
chown root:named /etc/rndc.key
chmod u=rw,g=r,o= /etc/rndc.key
chown named:named /var/named/named.empty
chmod u=rw,g=wr,o= /var/named/named.empty
chown named:named /var/named/named.localhost
chmod u=rw,g=wr,o= /var/named/named.localhost
chown named:named /var/named/named.loopback
chmod u=rw,g=wr,o= /var/named/named.loopback
chown -R named:named /var/named

#Start Named in foreground wtih log redirection to /var/named/log/*
exec /usr/sbin/named -f -u named -c /etc/named.conf $OPTIONS
