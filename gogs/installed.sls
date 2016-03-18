# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-installed:
  pkg.installed:
    - name: gogs
    - version: {{ salt['pillar.get']('gogs:version', 'None') }}
