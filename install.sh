#!/usr/bin/env bash

# rector.conf - The Salt reactor configuration file.
# mrSaltSlack_ret.sls - Salt sls file that sends data to Slack when a function returns.
# mrSaltSlack_start.sls - Salt sls file that sends data to Slack when a minion starts.

mkdir -p /etc/salt
mkdir -p /etc/salt/master.d
touch /etc/salt/master.d/reactor.conf

mkdir -p /srv/reactor
mv /src/mrSaltSlack_ret.sls /srv/reactor/
mv /src/mrSaltSlack_start.sls /srv/reactor/

# If the reactor has been declared, only insert the reactor connection.
if grep -q 'reactor:' /etc/salt/master.d/reactor.conf; then
  echo "
- 'salt/minion/*/start':
    - /srv/reactor/mrSaltSlack.sls
" >> /etc/salt/master.d/reactor.conf
else
  echo "
reactor:
- 'salt/minion/*/start':
    - /srv/reactor/mrSaltSlack.sls
" >> /etc/salt/master.d/reactor.conf
fi
