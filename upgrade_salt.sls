salt-packages:
  pkg.latest:
    - pkgs:
      - salt-minion
      - libzmq3
    - refresh: True

libzmq1:
  pkg.purged
