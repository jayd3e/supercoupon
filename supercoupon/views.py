from pyramid.view import view_config


@view_config(route_name='index',
             renderer='supercoupon:templates/pages/index.mako')
def index(request):
    return {}
