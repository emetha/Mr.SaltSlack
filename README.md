# saltstack-slack-bot
A slack bot for receiving status notifications from SaltStack. 

## Installation
Mr.SaltSlack is an extension between Salt and Slack. Because of this you will have to install [https://repo.saltstack.com/#ubuntu](Salt), create a slack webhook and run the Mr.SaltSlack script, before Mr.SaltSlack is able to run.  
### Install Salt
Click [https://repo.saltstack.com/#ubuntu](here) to go to the Salt installation guide. 

### Set up Slack webhook

### Install Mr.SaltSlack
Assuming that you either have not declared a salt reactor, or have declared the reactor in `/etc/salt/master.d/reactor.sls`, tou will only need to:
1. Add the webhook identifier: 

2. Run the installation script:
`sudo ./install.sh`
