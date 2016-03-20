# vim: ft=yaml softtabstop=2 tabstop=2 shiftwidth=2 expandtab autoindent

gogs-group:
  group.present:
    - name: git

gogs-user:
  user.present:
    - name: git
    - shell: /bin/bash
    - home: /home/git
    - groups:
      - git
    - require:
      - group: gogs-group

