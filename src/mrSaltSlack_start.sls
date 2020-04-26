slack-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Minion {{ data['id'] }} Started!"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: T010E8TJPSB/B010JFXBXFH/GUqH3k9XDC8cTnf59n2oEnCh
        attachment: "{{ data['data'] }}"
        color: "#F35A00"
