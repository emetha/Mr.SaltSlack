#!/usr/bin/env bash

# rector.conf - The Salt reactor configuration file.
# mrSaltSlack_ret.sls - Salt sls file that sends data to Slack when a function returns.
# mrSaltSlack_start.sls - Salt sls file that sends data to Slack when a minion starts.

# Read the Slack webhook identifier
echo "Insert your Slack webhook identifier:"
read identifier

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
    - /srv/reactor/mrSaltSlack_start.sls
- 'salt/job/*/ret/*':
    - /srv/reactor/mrSaltSlack_ret.sls
" >> /etc/salt/master.d/reactor.conf
else
  echo "
reactor:
- 'salt/minion/*/start':
    - /srv/reactor/mrSaltSlack_start.sls
- 'salt/job/*/ret/*':
    - /srv/reactor/mrSaltSlack_ret.sls
" >> /etc/salt/master.d/reactor.conf
fi

# Insert slack webhook identifier in mrSaltSlack sls files. (Replace placeholder "[[slack-identifier]]" with the supplied webhook identifier)
sed -i -e 's/[[slack-identifier]]/$identifier/g' /srv/reactor/SaltSlack_ret.sls
sed -i -e 's/[[slack-identifier]]/$identifier/g' /srv/reactor/SaltSlack_start.sls

