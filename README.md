Stouts.wsgi
===========

[![Build Status](https://travis-ci.org/Stouts/Stouts.wsgi.png)](https://travis-ci.org/Stouts/Stouts.wsgi)

Ansible role which deploys wsgi application (uwsgi, nginx, supervisor, virtualenv)

* Install and setup supervisor, nginx, uwsgi;
* Setup and manage project requirements and virtualenv;
* Deploy project with uwsgi, enable monitoring;


#### Requirements & Dependencies

- [Stouts.deploy](https://github.com/Stouts/Stouts.deploy)
- [Stouts.python](https://github.com/Stouts/Stouts.python)
- [Stouts.nginx](https://github.com/Stouts/Stouts.nginx)
- [Stouts.supervisor](https://github.com/Stouts/Stouts.supervisor)


#### Variables

The role variables and default values.

```yaml
wsgi_enabled: yes                                     # Enable the role

wsgi_project_name: "{{deploy_project_name}}"
wsgi_user: "{{deploy_user}}"
wsgi_group: "{{wsgi_user}}"
wsgi_deb_packages: []                                 # Additional deb packages which will be installed
wsgi_pip_packages: []                                 # Additional pip packages which will be installed

# Directories
wsgi_app_dir: "{{deploy_source_dir}}"
wsgi_run_dir: "{{deploy_run_dir}}"
wsgi_cfg_dir: "{{deploy_configuration_dir}}"
wsgi_log_dir: "{{deploy_logs_dir}}"

wsgi_app_path: "{{deploy_source_dir}}/wsgi.py"        # File contains wsgi application
wsgi_requirements: "{{wsgi_app_dir}}/requirements.txt" # Requirements file

wsgi_virtualenv: "{{deploy_dir}}/venv"                # Setup app to virtualenv (set blank to disable)
wsgi_virtualenv_python: python                        # Virtualenv python version

wsgi_nginx_hostname: "{{inventory_hostname}}"         # Listen hostname
wsgi_nginx_port: 80                                   # Listen port
wsgi_nginx_configuration_path: "{{wsgi_cfg_dir}}/nginx.conf"
wsgi_nginx_static_locations: [/static/, /media/]
wsgi_nginx_options: []

wsgi_supervisor_configuration_path: "{{wsgi_cfg_dir}}/supervisor.ini"
wsgi_supervisor_process_name: uwsgi-{{wsgi_project_name}}
# Enable http monitoring (set blank to disable)
wsgi_supervisor_httpok: "httpok -p {{wsgi_supervisor_process_name}} http://{{wsgi_nginx_hostname}}:{{wsgi_nginx_port}}"

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
