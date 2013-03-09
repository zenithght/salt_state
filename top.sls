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
    - logstash.client
  'ls*':
    - groups
    - users
    - vim
{#  'lsshipper*':#}
{#    - logstash.shipper#}
{#  'lsbroker*':#}
{#    - logstash.broker#}
{#  'lsindexer*':#}
{#    - logstash.indexer#}
{#  'lselasticsearch*':#}
{#    - logstash.elasticsearch#}
{#  'lsweb*':#}
{#    - logstash.webinterface#}
