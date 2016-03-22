# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-requirements:
  pkg.latest:
    - pkgs:
      - git

gogs-installed:
  archive.extracted:
    - name: /opt/
    - source: https://dl.gogs.io/gogs_v{{ salt['pillar.get']('gogs:version') }}_linux_amd64.tar.gz
    - source_hash: {{ salt['pillar.get']('gogs:hash') }}
    - archive_format: tar
    - if_missing: /opt/gogs/
  file.directory:
    - name: /opt/gogs/
    - user: git
    - group: git
    - recurse:
       - user
       - group
