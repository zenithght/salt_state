{% for name, args in pillar['users'].iteritems() %}
{{ name }}:
  user:
    - present
    - shell: {{ args['shell'] }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
{% if 'password' in args %}
    - password: {{ args['password'] }}
{% else %}
    - password: '!'
{% endif %}
{% endfor %}
