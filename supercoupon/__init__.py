import os

from paste.deploy import loadapp
from pyramid.config import Configurator
from waitress import serve


def main(global_config, **settings):
    config = Configurator(settings=settings)

    # Plugin
    config.include('pyramid_mako')
    config.include('pyramid_tm')

    # Routes
    config.add_route('index', '/')

    # Static Views
    config.add_static_view(settings['supercoupon.static_assets_location'], 'supercoupon:static')

    # Scan
    config.scan()
    return config.make_wsgi_app()


def run_web():
    port = int(os.environ['PORT'])

    app = loadapp('config:%s.ini' % os.environ['MODE'], relative_to='.')
    serve(app, host='0.0.0.0', port=port, url_scheme=os.environ['SCHEME'])
