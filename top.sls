base:
  'staging0[1345]':
    - groups
    - users
    - vim
    - hosts
    - iptables
  'staging0[13]':
    - nginx
  'staging02':
    - logstash.shipper
