{% if data['act'] == 'accept' %}
slack-auth-accept-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Minion Key Accepted!"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: identifierplaceholder
        attachment: "Key for minion with id {{ data['id'] }} has been accepted!"
        color: "#F35A00"
{% endif %}

{% if data['act'] == 'pend' %}
slack-auth-accept-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Minion Key Pending..."
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: identifierplaceholder
        attachment: "Key for minion with id {{ data['id'] }} is pending."
        color: "#F35A00"
{% endif %}

{% if data['act'] == 'reject' %}
slack-auth-accept-message:
  local.slack.call_hook:
    - tgt: {{ data['id'] }}
    - args:
        message: "Minion Key Rejected!"
        username: MrSaltSlack
        channel: "#saltstack-slack-bot"
        identifier: identifierplaceholder
        attachment: "Key for minion with id {{ data['id'] }} has been rejected!"
        color: "#F35A00"
{% endif %}
