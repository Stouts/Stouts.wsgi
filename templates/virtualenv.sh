#!/bin/sh

{% for app in wsgi_applications %}

{% set virtualenv = app.get('virtualenv', wsgi_virtualenv) -%}
{% set pip = (virtualenv + '/bin/pip') if virtualenv else 'pip' -%}

{%- if virtualenv %}
[ -d {{virtualenv}} ] || virtualenv {{virtualenv}} -p {{app.get('virtualenv_python', wsgi_virtualenv_python)}}
{% endif %}

{{pip}} install uWSGI

{% if wsgi_pip_packages %}
{{pip}} install {{wsgi_pip_packages|join(' ')}}
{% endif %}

{% if app.get('pip_requirements') %}
{{pip}} install -r {{app.get('pip_requirements')}}
{% endif %}

{% endfor %}
