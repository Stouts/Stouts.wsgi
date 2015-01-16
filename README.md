Stouts.wsgi
===========

[![Build Status](http://img.shields.io/travis/Stouts/Stouts.wsgi.svg?style=flat-square)](https://travis-ci.org/Stouts/Stouts.wsgi)
[![Galaxy](http://img.shields.io/badge/galaxy-Stouts.wsgi-blue.svg?style=flat-square)](https://galaxy.ansible.com/list#/roles/831)

Ansible role which deploys wsgi application (uwsgi/gunicorn, nginx, virtualenv)

* Install and setup nginx, uwsgi/gunicorn;
* Setup and manage project requirements and virtualenv;
* Deploy project with wsgi/gunicorn, enable monitoring;
* Support multiple WSGI applications;


#### Requirements & Dependencies

- [Stouts.deploy](https://github.com/Stouts/Stouts.deploy)
- [Stouts.python](https://github.com/Stouts/Stouts.python)
- [Stouts.nginx](https://github.com/Stouts/Stouts.nginx)


#### Variables

The role variables and default values.

```yaml
wsgi_enabled: yes                                     # Enable the role

wsgi_user: "{{deploy_user}}"                          # An user to run WSGI applications
wsgi_group: "{{deploy_group}}"                        # A group to run WSGI applications
wsgi_server: uwsgi                                    # A server which provide wsgi integration (uwsgi/gunicorn)
wsgi_reload: no                                       # Reload servers when code changes

wsgi_pip_packages: []                                 # Pip packages to install

wsgi_applications:                                    # Setup your wsgi application here
- name: "{{deploy_app_name}}"
  pip_requirements: "{{wsgi_app_dir}}/requirements.txt"

# Default directories
wsgi_run_dir: "{{deploy_run_dir}}"
wsgi_etc_dir: "{{deploy_etc_dir}}"
wsgi_log_dir: "{{deploy_log_dir}}"
wsgi_app_dir: "{{deploy_src_dir}}"

# Default virtualenv options
wsgi_virtualenv: "{{deploy_dir}}/env"
wsgi_virtualenv_python: python

# UWSGI default options (can be redefined for each wsgi app)
wsgi_uwsgi_enable_threads: no
wsgi_uwsgi_read_timeout: 300
wsgi_uwsgi_processes: 4
wsgi_uwsgi_max_requests: 2000
wsgi_uwsgi_no_orphans: yes
wsgi_uwsgi_options: []

# Gunicorn default options (can be redefined for each wsgi app)
wsgi_gunicorn_worker: sync
wsgi_gunicorn_workers: 4

# Nginx default options (can be redefined for each wsgi app)
wsgi_nginx_port: 80                                   # Default port to listen
wsgi_nginx_redirect_www: no                           # Redirect www.servername to servername
wsgi_nginx_options: []
wsgi_nginx_servernames: "{{inventory_hostname}}"      # Listen servernames (separated by space)
wsgi_nginx_ssl: no                                    # Set yes to enable SSL
wsgi_nginx_ssl_crt:                                   # Path to certificate bundle
wsgi_nginx_ssl_key:                                   # Path to certificate key
wsgi_nginx_ssl_port: 443
wsgi_nginx_ssl_redirect: no                           # Redirect to SSL port
wsgi_nginx_static_locations: [/static/, /media/]
wsgi_nginx_static_root: "{{wsgi_app_dir}}"

# Logging options
wsgi_log_rotate: yes                                   # Rotate wsgi logs.
wsgi_log_rotate_options:
- "create 644 {{wsgi_user}} {{wsgi_group}}"
- compress
- copytruncate
- daily
- dateext
- rotate 7
- size 10M
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
    wsgi_applications:
    - name: facebook
        nginx_servernames: www.facebook.com facebook.com
        file: /opt/facebook/wsgi.py
    - name: twitter
        server: gunicorn
        nginx_servernames: twitter.com
        module: twitter:app
```

#### License

Licensed under the MIT License. See the LICENSE file for details.


#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Stouts/Stouts.wsgi/issues)!
