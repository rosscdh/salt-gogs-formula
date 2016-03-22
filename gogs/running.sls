# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

/etc/init/gogs.conf:
  file.managed:
    - source: salt://gogs/files/upstart-gogs.jinja
    - template: jinja

gogs-running:
  service.running:
    - name: gogs
    - require:
      - file: /etc/init/gogs.conf
