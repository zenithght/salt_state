import socket


def datacenter():
    grains = {}
    local_ip = socket.gethostbyname(socket.gethostname())

    if '192.168.' in local_ip:
        grains['datacenter'] = 'incero'
    else:
        grains['datacenter'] = 'rackspace'

    return grains
