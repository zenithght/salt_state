base:
  '*':
    - groups
    - users
    - vim
    - hosts
  'staging0[13]':
    - nginx
  'staging02':
    - logstash
