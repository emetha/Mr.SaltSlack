{% if data['fun'] != 'slack.call_hook' and data['success'] == true %}
slack-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Command {{ data['fun'] }} was successfully issued!"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: [[slackIdentifier]]
        attachment: "MinionID: {{ data['id'] }}
                     \nReturn: {{ data['return'] }}"
        color: "#00cc00"
{% endif %}

{% if data['fun'] != 'slack.call_hook' and data['success'] == false %}
slack-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Command {{ data['fun'] }} has failed... "
        attachment: "MinionID: {{ data['id'] }}
                     \nReturn: {{ data['return'] }}"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        color: "#cc0000"
        identifier: [[slackIdentifier]]
{% endif %}
