# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-repo:
  pkgrepo.managed:
    - humanname: Gogs Repository
    - name: deb https://deb.packager.io/gh/pkgr/gogs trusty pkgr
    - file: /etc/apt/sources.list.d/gogs.list
    - key_url: https://deb.packager.io/key
