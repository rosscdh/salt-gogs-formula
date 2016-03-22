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
      {% for group in user.get('gogs:groups', []) -%}
      - {{ group }}
      {% endfor %}
    - require:
      - group: gogs-group

