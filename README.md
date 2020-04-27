# Mr.SaltSlack
A slack bot for receiving status notifications from SaltStack. 

Mr.SaltSlack offers the following features in its current state:  
* Notification on minion start
* Notification on job return (Success/Fail and return code)
* Notification on minion-key authentication check status (Success/Pending/Fail)

## Installation
Mr.SaltSlack is a link between Salt and Slack. Because of this you will have to install [Salt](https://repo.saltstack.com/#ubuntu), create a slack webhook and run the Mr.SaltSlack installation script, before Mr.SaltSlack is able to run.  

### Install Salt
Click [here](https://repo.saltstack.com/#ubuntu) to go to the Salt installation guide.  

In the time of writing, the Salt installation goes as follows, on Ubuntu systems:

1. Run in terminal: `wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -`
2. Save the following file to /etc/apt/sources.list.d/saltstack.list: `deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main`
3. Run in terminal: `sudo apt update`
4. Run in terminal: `sudo apt install salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api`

Don't forget add the salt minions' keys to the salt master:
1. Make sure the minions' configuration resolve to the salt-master (for example by creating an entry that resolves salt to the IP of the salt-master in /etc/hosts).
2. Display keys: `salt-key -L`. 
3. Accept all minions' keys: `salt-key -A` (not recommended from a security perspective).
  
*For further information about initial configuration of Salt: See [Salt](https://docs.saltstack.com/en/latest/ref/configuration/index.html)'s own page.*

### Set up Slack webhook
Salt gives a good guide on how to set up a webhook for your Slack App, which you can find [here](https://api.slack.com/messaging/webhooks).

In the time of writing, setting up the Slack webhook goes as follows:

1. Create a Slack App (see [here](https://api.slack.com/start/building)).
2. Enable incoming webhooks, via your Apps management dashboard, by selecting *incoming webhooks* feature and switch on *activate incoming webhooks* toggle. 
3. After step 2, a few more options should be available. One of these is the *add new webhook to workspace* button, click on it to generate an incoming webhook URL. 
4. You will then be re-directed and be asked for other information. Here, you choose the channel that the app will post to and click *authorize* once done. 
5. Now, you will be sent back to the app settings and under the section *Webhooks URL for Your Workspace* you will find a new webhook URL entry which should look something like this:

```

https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX

```

6. The webhook token that you need for Mr.SaltSlack is `https://hooks.slack.com/services/< your-webhook-token >`. Note that the webhook token is what you provide as the webhook identifier when prompted by the script.  

### Install Mr.SaltSlack
Assuming that you either have not declared a salt reactor, or have declared the reactor in `/etc/salt/master.d/reactor.sls`, you only need to run the installation script:  
`sudo ./install.sh`  
and supply your Slack webhook identifier when prompted.

## How to use Mr.SaltSlack
Assuming you have installed Mr.SaltSlack correctly and that you want all the default features that Mr.SaltSlack provides, you don't have to do anything. When a monitored event in Salt happens, Mr.SaltSlack will automatically message you in your Slack channel. 
  
But you can always disable features or contribute by adding more!

### Disable features
To disable a feature, all you need to do is remove/comment the feature's respective code block in `/etc/salt/master.d/reactor.conf`.  
  
**To disable notification on minion start, comment the following lines:**  
```bash
- 'salt/minion/*/start':
    - /srv/reactor/mrSaltSlack_start.sls
```  
**To disable notification on job return, comment the following lines:**  
```bash
- 'salt/job/*/ret/*':
    - /srv/reactor/mrSaltSlack_ret.sls
```
**To disable notification on minion-key authentication check, comment the following lines:**  
```bash
- 'salt/auth':
    - /srv/reactor/mrSaltSlack_auth.sls
```
### Debugging
If you run into issues, we recommend using the debug mode of the Salt master:  
`salt-master -l debug`  
This mode gives more information than simply setting the logging mode to "debug" in the master configuration file.  
  
You can also monitor the event bus with:  
`salt-run state.event pretty=True`
  
Have you tried turning it off and on again? Some configurations and other settings are loaded on start, try to restart the salt master and salt minions.
