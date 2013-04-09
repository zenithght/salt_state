from salt.utils.socket_util import ip4_addrs

def datacenter():
    grains = {}

    local_ip = ip4_addrs()

    if '192.168.' in local_ip:
        grains['datacenter'] = 'incero'
    else:
        grains['datacenter'] = 'rackspace'

    return grains
