{% for username, args in pillar['users'].iteritems() %}
{{ username }}:
  user.present:
    - shell: {{ args['shell'] }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
{% if 'password' in args %}
    - password: {{ args['password'] }}
{% else %}
    - password: '!'
{% endif %}

{% if 'ssh_auth' in args %}
{{ args['ssh_auth']['key'] }}:
  ssh_auth.present:
    - user: {{ username }}
    - comment: {{ args['ssh_auth']['comment'] }}
{% endif %}
{% endfor %}
