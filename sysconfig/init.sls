/etc/iptables-rules:
  file:
    - managed
    - source: salt://sysconfig/iptables-rules
