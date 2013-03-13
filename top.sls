base:
  '*':
    - groups
    - users
    - vim
  'staging*':
    - hosts
    - iptables
  'staging0[13]':
    - nginx
  'staging02':
    - logstash.client

  'ls*':
    - hosts

  'lsshipper*':
    - logstash.shipper
  'ls-broker*':
    - logstash.broker
  'lsindexer*':
    - logstash.indexer
  'lselasticsearch*':
    - logstash.elasticsearch
  'ls-web*':
    - logstash.webinterface
