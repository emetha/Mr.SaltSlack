slack-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Minion {{ data['id'] }} Started!"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: identifierplaceholder
        attachment: "{{ data['data'] }}"
        color: "#F35A00"
