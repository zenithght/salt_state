from salt.utils.socket_util import ip4_addrs
try:
        from ipaddress import IPv4Address
except ImportError:
        from salt.util.socket_util import IPv4Address

def datacenter():
    grains = {}

    start = IPv4Address(u'192.168.0.0')
    end = IPv4Address(u'192.168.255.255')

    for ip in [IPv4Address(unicode(x)) for x in ip4_addrs()]:
        if start <= ip <= end:
            grains['datacenter'] = 'incero'
            break
    else:
        grains['datacenter'] = 'rackspace'

    return grains
