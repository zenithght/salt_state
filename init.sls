{% for user, args in pillar['users'].iteritems() %}
{{ user }}:
  user.present:
    - home: /home/{{ user }}
    - shell: {{ pillar.unprivileged_shell or "/bin/bash" }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
{% if 'password' in args %}
    - password: {{ args['password'] }}
{% else %}
    - password: '!'
{% endif %}
{% if pillar.unprivileged_groups %}
    - groups: {{ pillar.unprivileged_groups }}
{% endif %}

{% if 'ssh_auth' in args %}
/home/{{ user }}/.ssh:
  file.directory:
    - user: {{ user }}
    - group: {{ args['group'] }}
    - mode: 700
    - require:
      - user: {{ user }}

/home/{{ user }}/.ssh/authorized_keys:
  file.managed:
    - user: {{ user }}
    - group: {{ args['group'] }}
    - mode: 600
    - require:
      - file: /home/{{ user }}/.ssh

{{ args['ssh_auth']['key'] }}:
  ssh_auth.present:
    - user: {{ user }}
    - comment: {{ args['ssh_auth']['comment'] }}
    - require:
      - file: /home/{{ user }}/.ssh/authorized_keys
{% endif %}
{% endfor %}
