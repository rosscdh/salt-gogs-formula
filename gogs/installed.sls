# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-requirements:
  pkg.latest:
    - pkgs:
      - git

gogs-installed:
  archive.extracted:
    - name: /opt/gogs/
    - source: https://cdn.gogs.io/gogs_v{{ salt['pillar.get']('gogs:version') }}_linux_amd64.tar.gz
    - archive_format: tar
    - user: git
    - group: git
    - if_missing: /opt/gogs/
