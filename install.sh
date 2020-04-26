#!/usr/bin/env bash
mkdir -p /etc/salt
mkdir -p /etc/salt/master.d
touch /etc/salt/master.d/reactor.sls

mkdir -p /srv/reactor
mv /src/mrSaltSlack.sls /srv/reactor/mrSaltSlack.sls

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

mkdir -p /usr/local/bin/salt_scripts/
mv send_to_slack.py /usr/local/bin/salt_scripts/send_to_slack.py

echo 'test-python:
  local.cmd.run:
    - tgt: {{ data['id'] }}
    - args:
      - cmd: python /usr/local/bin/salt_scripts/send_to_slack.py
    ' >> /srv/salt/mrSaltSlack.sls
