from supercoupon.models import Listing


class Queries(object):
    def __init__(self, db):
        self.db = db

    def by_id(self, id_):
        return self.db.get(id_)


class ListingQueries(Queries):
    def __init__(self, db):
        self.db = db

    def by_created(self, limit=10, offset=0):
        return self.db.query(Listing). \
                       order_by(Listing.created). \
                       offset(offset).limit(limit)

    def by_featured(self, limit=20, offset=0):
        return self.db.query(Listing). \
                       filter_by(featured=True). \
                       order_by(Listing.created). \
                       offset(offset).limit(limit)
