from pyramid.view import view_config

from supercoupon.queries import ListingQueries


@view_config(route_name='index',
             renderer='supercoupon:templates/pages/index.mako')
def index(request):
    db = request.db

    # queries
    listing_queries = ListingQueries(db)

    # get all of the featured listings
    featured = listing_queries.by_featured(limit=8).all()
    listings = listing_queries.by_created(limit=40).all()

    return {
        'featured': featured,
        'listings': listings
    }


@view_config(route_name='about',
             renderer='supercoupon:templates/pages/about.mako')
def about(request):
    return {}


@view_config(route_name='coupons',
             renderer='supercoupon:templates/pages/coupons.mako')
def coupons(request):
    return {}
