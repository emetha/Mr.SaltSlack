# Mr.SaltSlack
A slack bot for receiving status notifications from SaltStack. 

## Installation
Mr.SaltSlack is a link between Salt and Slack. Because of this you will have to install [Salt](https://repo.saltstack.com/#ubuntu), create a slack webhook and run the Mr.SaltSlack installation script, before Mr.SaltSlack is able to run.  
### Install Salt
Click [here](https://repo.saltstack.com/#ubuntu) to go to the Salt installation guide.  

In the time of writing, the Salt installation goes as follows, on Ubuntu systems:

1. Run in terminal: `wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -`
2. Save the following file to /etc/apt/sources.list.d/saltstack.list: `deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main`
3. Run in terminal: `sudo apt-get update`
4. Run in terminal: `sudo apt install salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api`

### Set up Slack webhook

### Install Mr.SaltSlack
Assuming that you either have not declared a salt reactor, or have declared the reactor in `/etc/salt/master.d/reactor.sls`, tou will only need to:
1. Add the webhook identifier: 

2. Run the installation script:
`sudo ./install.sh`
