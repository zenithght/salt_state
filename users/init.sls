{% for user, args in pillar['users'].iteritems() %}
{{ user }}:
  user.present:
    - home: /home/{{ user }}
    - shell: '/bin/bash'
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
    - fullname: {{ args['fullname'] }}
{% if args['disable_password'] == 'True' %}
    - password: '!'
{% endif %}
    - groups: {{ args['groups'] }}

{% if 'ssh_auth' in args %}
/home/{{ user }}/.ssh:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 700
    - require:
      - user: {{ user }}

/home/{{ user }}/.ssh/authorized_keys:
  file.managed:
    - user: {{ user }}
    - group: {{ user }}
    - mode: 600
    - require:
      - file: /home/{{ user }}/.ssh

present_key:
  ssh_auth.present:
    - user: {{ user }}
    - require:
      - file: /home/{{ user }}/.ssh/authorized_keys
    - source: salt://ssh_keys/{{ user }}.id_rsa.pub
{% endif %}
{% endfor %}
