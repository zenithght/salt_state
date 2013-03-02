{% for user, args in pillar['users'].iteritems() %}
{{ user }}:
  group.present:
    - name: {{ user}}
    - gid: {{ args['gid'] }}

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
    - require:
{% for group in args['groups'] %}
      - group: {{ group }}
{% endfor %}
      - group: {{ user }}


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

  ssh_auth.present:
    - user: {{ user }}
    - require:
      - file: /home/{{ user }}/.ssh/authorized_keys
    - source: salt://ssh_keys/{{ user }}.id_rsa.pub
{% endif %}
{% endfor %}
