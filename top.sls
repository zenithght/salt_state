base:
  '*':
    - collectd
    - groups
    - users
    - vim
    - logstash.client
  'staging*':
    - hosts
    - iptables
  'staging0[13]':
    - nginx
  'db-*':
    - postgresql.users
  'data*':
    - postgresql.users
  '*heartbeat*':
    - redis
    - redis.live
  'ls*':
    - hosts
  'ls-shipper*':
    - logstash.shipper
  'ls-broker*':
    - logstash.broker
    - redis.live
  'ls-indexer*':
    - logstash.indexer
  'ls-elasticsearch*':
    - logstash.elasticsearch
  'ls-web*':
    - logstash.webinterface
  'zookeeper*':
    - zookeeper
