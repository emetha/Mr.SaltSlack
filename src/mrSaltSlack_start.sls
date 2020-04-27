slack-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Minion {{ data['id'] }} Started!"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: [[slackIdentifier]]
        attachment: "{{ data['data'] }}"
        color: "#F35A00"
