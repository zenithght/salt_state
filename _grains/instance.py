import socket


def datacenter():
    grains = {}
    host = socket.gethostname()

    if 'staging' in host:
        grains['instance'] = 'staging'
    elif 'trunk' in host:
        grains['instance'] = 'trunk'
    else:
        grains['instance'] = 'production'

    return grains
