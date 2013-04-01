def datacenter():
    grains = {}

    local_ip = __salt__['network.ip_addrs']()

    if '192.168.' in local_ip:
        grains['datacenter'] = 'incero'
    else:
        grains['datacenter'] = 'rackspace'

    return grains
