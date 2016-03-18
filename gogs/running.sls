# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-running:
  service.running:
    - name: gogs
    - require:
      - pkg: gogs
