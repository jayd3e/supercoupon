from pyramid.view import view_config

from supercoupon.queries import ListingQueries
from supercoupon.models import PageLoad


@view_config(route_name='index',
             renderer='supercoupon:templates/pages/index.mako')
def index(request):
    db = request.db
    category_id = None

    # queries
    listing_queries = ListingQueries(db)

    # get the amount of page views and increment it
    page_load = db.query(PageLoad).first()
    page_load.page_load_num += 1

    # if we have a category id, obtain it
    category_id = request.GET.get('category', None)

    # get all of the featured listings
    featured = listing_queries.by_featured(limit=8).all()
    listings = listing_queries.by_created(limit=40, category_id=category_id).all()

    db.flush()
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
