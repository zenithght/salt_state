base:
  '*':
    - groups
    - users
    - vim
    - logstash.client
  'staging*':
    - hosts
    - iptables
  'staging0[13]':
    - nginx

  'ls*':
    - hosts

  'ls-shipper*':
    - logstash.shipper
  'ls-broker*':
    - logstash.broker
  'lsindexer*':
    - logstash.indexer
  'lselasticsearch*':
    - logstash.elasticsearch
  'ls-web*':
    - logstash.webinterface
