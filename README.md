Stouts.wsgi
===========

[![Build Status](https://travis-ci.org/Stouts/Stouts.wsgi.png)](https://travis-ci.org/Stouts/Stouts.wsgi)

Ansible role which deploys wsgi application (uwsgi, nginx, supervisor)


#### Requirements & Dependencies

- https://github.com/Stouts/Stouts.deploy
- https://github.com/Stouts/Stouts.python
- https://github.com/Stouts/Stouts.nginx
- https://github.com/Stouts/Stouts.supervisor


#### Variables
```yaml
wsgi_enabled: yes                                     # Enable the role

wsgi_app_path: "{{deploy_source_dir}}/wsgi.py"
wsgi_apt_packages: []

wsgi_app_dir: "{{deploy_source_dir}}"
wsgi_run_dir: "{{deploy_run_dir}}"
wsgi_cfg_dir: "{{deploy_configuration_dir}}"
wsgi_project_name: "{{deploy_project_name}}"
wsgi_hostname: "{{inventory_hostname|default('localhost')}}"
wsgi_pip_packages: []

wsgi_virtualenv: "{{deploy_dir}}/venv"
wsgi_virtualenv_python: python
wsgi_virtualenv_requirements: "{{wsgi_app_dir}}/requirements.txt"

wsgi_nginx_configuration_path: "{{wsgi_cfg_dir}}/nginx.conf"
wsgi_nginx_static_locations: [/static/, /media/]
wsgi_nginx_options: []

wsgi_supervisor_configuration_path: "{{wsgi_cfg_dir}}/supervisor.ini"

wsgi_uwsgi_configuration_path: "{{wsgi_cfg_dir}}/uwsgi.ini"
wsgi_uwsgi_socket: "{{wsgi_run_dir}}/uwsgi.sock"
wsgi_uwsgi_reload: no
wsgi_uwsgi_processes: 4
```

#### Usage

Clone dependencies.
Add `Stouts.wsgi` to your roles and change variables in your playbook file.

Example:

```yaml

- hosts: all

  roles:
    - Stouts.wsgi

  vars:
    wsgi_hostname: facebook.com

```

#### License

Licensed under the MIT License. See the LICENSE file for details.


#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.wsgi/issues)!
