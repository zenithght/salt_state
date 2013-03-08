base:
  '*':
    - groups
    - users
    - vim
  'staging0[13]':
    - nginx
  'staging02':
    - logstash/shipper
