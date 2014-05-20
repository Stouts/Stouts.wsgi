Stouts.wsgi
===========

[![Build Status](https://travis-ci.org/Stouts/Stouts.wsgi.png)](https://travis-ci.org/Stouts/Stouts.wsgi)

Ansible role which deploys wsgi application (uwsgi, nginx, supervisor)


#### Requirements & Dependencies

- https://github.com/Ansibles/python
- https://github.com/Stouts/Stouts.base


#### Variables
```yaml
wsgi_enabled: yes                                     # Enable the role
wsgi_app_path: "{{ base_source_directory }}/wsgi.py"
wsgi_apt_packages: []
wsgi_directory: "{{ base_source_directory }}"
wsgi_hostname: "{{ inventory_hostname_short|default('stout.io') }}"
wsgi_nginx_configuration_path: "{{base_configuration_directory}}/nginx.conf"
wsgi_nginx_static_locations: [/static/, /media/]
wsgi_nginx_options: []
wsgi_pip_packages: []
wsgi_project_name: "{{base_project_name}}"
wsgi_requirements_path: "{{ base_source_directory }}/requirements.txt"
wsgi_supervisor_configuration_path: "{{base_configuration_directory}}/supervisor.ini"
wsgi_uwsgi_configuration_path: "{{base_configuration_directory}}/uwsgi.ini"
wsgi_uwsgi_socket: "{{ base_run_directory }}/uwsgi.sock"
wsgi_uwsgi_reload: no
wsgi_uwsgi_processes: 4
wsgi_virtualenv: "{{ base_deploy_directory }}/venv"
wsgi_virtualenv_python: python
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
