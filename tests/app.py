""" Simplest wsgi application. """


def application(environ, start_response):
    """ hello world. """
    status = '200 ok'
    response_headers = [('content-type', 'text/plain')]
    start_response(status, response_headers)
    return ['hello world!\n']
