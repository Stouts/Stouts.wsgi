Stouts.wsgi
===========

[![Build Status](https://travis-ci.org/Stouts/Stouts.wsgi.png)](https://travis-ci.org/Stouts/Stouts.wsgi)

Ansible role which deploys wsgi application (uwsgi, nginx, supervisor)


#### Requirements & Dependencies

- https://github.com/Ansibles/python
- https://github.com/Stouts/st.base


#### Variables
```yaml
wsgi_app_path: "{{ base_source_directory }}/wsgi.py"        # path to wsgi file
wsgi_directory: "{{ base_source_directory }}"               # change directory
wsgi_hostname: "{{ inventory_hostname_short|default('stout.io') }}" # nginx server hostname
wsgi_python_version: 2.7.4
wsgi_requirements_path: "{{ base_source_directory }}/requirements.txt" # virtualenv requirements
wsgi_uwsgi_socket: "{{ base_run_directory }}/uwsgi.sock"    # uwsgi socket
wsgi_virtualenv: "{{ base_deploy_directory }}/venv"         # uwsgi virtualenv (leave empty for disable)
wsgi_apt_packages: []                                       # additional debian packages which be installed
wsgi_pip_packages: []                                       # additional python packages which be installed
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
