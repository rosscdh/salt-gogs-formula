# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-server-default_vhost_absent:
  file.absent:
    - name: /etc/nginx/sites-enabled/default

/etc/nginx/sites-available/gogs-vhost.conf:
  file.managed:
    - source: salt://services/nginx/files/vhost.conf.jinja
    - template: jinja
    - context:
        proxy_ip: {{ salt['pillar.get']('gogs:nginx:proxy:ip', '127.0.0.1') }}
        proxy_port: {{ salt['pillar.get']('gogs:nginx:proxy:port', '8153') }}
        server_name: {{ salt['pillar.get']('gogs:nginx:server_name', '') }}
        ssl_cert: {{ salt['pillar.get']('gogs:nginx:ssl_cert', '/etc/ssl/localhost/aws.aoi.avira.net.pem') }}
        ssl_key: {{ salt['pillar.get']('gogs:nginx:ssl_key', '/etc/ssl/localhost/aws.aoi.avira.net.key') }}
    - require:
      - pkg: nginx
      - service: gogs
    - require_in:
      - service: nginx
    - watch_in:
      - service: nginx

/etc/nginx/sites-enabled/gogs-vhost.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/gogs-vhost.conf
    - require:
      - pkg: nginx
      - service: gogs
      - file: /etc/nginx/sites-available/gogs-vhost.conf
    - require_in:
      - service: nginx
    - watch_in:
      - service: nginx

