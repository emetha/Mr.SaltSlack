#!/usr/bin/env bash
mkdir -p /etc/salt
mkdir -p /etc/salt/master.d
touch /etc/salt/master.d/reactor.sls

if grep -q 'reactor:' /etc/salt/master.d/reactor.sls; then
  echo 'WRITE OUR TEXT' >> /etc/salt/master.d/reactor.sls
fi

mkdir -p /srv/salt
touch /srv/salt/mrSaltStack

echo 'All
  of
    our
    text' >> /srv/salt/mrSaltStack
