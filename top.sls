base:
  '*':
    - groups
    - users
    - vim
    - hosts
    - iptables
  'staging0[13]':
    - nginx
  'staging02':
    - logstash
