# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-nginx:
  pkg.installed:
    - name: nginx

gogs-server-default_vhost_absent:
  file.absent:
    - name: /etc/nginx/sites-enabled/default

/etc/nginx/sites-available/gogs.conf:
  file.managed:
    - source: salt://services/nginx/files/nginx-vhost.conf.jinja
    - template: jinja
    - context:
        proxy_ip: {{ salt['pillar.get']('gogs:nginx:proxy:ip', '127.0.0.1') }}
        proxy_port: {{ salt['pillar.get']('gogs:nginx:proxy:port', '3000') }}
        server_name: {{ salt['pillar.get']('gogs:hostname', '_') }}
        ssl_cert: {{ salt['pillar.get']('gogs:nginx:ssl_cert', '/etc/ssl/nginx/nginx.pem') }}
        ssl_key: {{ salt['pillar.get']('gogs:nginx:ssl_key', '/etc/ssl/nginx/nginx.key') }}
    - require:
      - pkg: nginx
      - service: gogs
    - require_in:
      - service: nginx
    - watch_in:
      - service: nginx

/etc/nginx/sites-enabled/gogs.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/gogs.conf
    - require:
      - pkg: nginx
      - service: gogs
      - file: /etc/nginx/sites-available/gogs.conf
    - require_in:
      - service: nginx
    - watch_in:
      - service: nginx

