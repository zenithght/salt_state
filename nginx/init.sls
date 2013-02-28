nginx:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/mime.types
      - file: /etc/nginx/conf.d/*.conf
    - require:
      - pkg: nginx
