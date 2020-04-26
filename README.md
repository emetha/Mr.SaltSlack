# Mr.SaltSlack
A slack bot for receiving status notifications from SaltStack. 

Mr.SaltSlack offers the following features in its current state:  


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
Assuming that you either have not declared a salt reactor, or have declared the reactor in `/etc/salt/master.d/reactor.sls`, you only need to run the installation script:  
`sudo ./install.sh`  
and supply your Slack webhook identifier when prompted.

## How to use Mr.SaltSlack
Assuming you have installed Mr.SaltSlack correctly and that you want all the default features that Mr.SaltSlack provides, you don't have to do anything. When a monitored event in Salt happens, Mr.SaltSlack will automatically message you in your Slack channel.  
  
But you can always disable features or contribute by adding more!

### Disable features
To disable a feature, all you need to do is remove/comment the feature's respective code blocke in `/etc/salt/master.d/reactor.conf`.  
  
**To disable notification on minion start, comment the following lines:**  
`- 'salt/minion/*/start':
    - /srv/reactor/mrSaltSlack_start.sls`  
**To disable notification on job return, comment the following lines:**  
`- 'salt/job/*/ret/*':
    - /srv/reactor/mrSaltSlack_ret.sls`
