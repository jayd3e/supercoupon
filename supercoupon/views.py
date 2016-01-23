from pyramid.view import view_config

from supercoupon.queries import ListingQueries


@view_config(route_name='index',
             renderer='supercoupon:templates/pages/index.mako')
def index(request):
    db = request.db

    # queries
    listing_queries = ListingQueries(db)

    # get all of the featured listings
    featured = listing_queries.by_featured().all()
    listings = listing_queries.by_created().all()

    return {
        'featured': featured,
        'listings': listings
    }
