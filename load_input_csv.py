import csv

from datetime import datetime
from pyramid.paster import bootstrap

from supercoupon.models import Listing


def main(request):
    db = request.db
    tm = request.tm

    with open('input.csv', 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        for row in reader:
            listing = Listing(created=datetime.now(),
                              title=row[1].strip(),
                              description=row[2].strip(),
                              url=row[3].strip(),
                              discount=row[4].strip(),
                              category_id=int(row[5].strip()),
                              image_url=row[7].strip(),
                              featured=row[0] == 'TRUE')
            db.add(listing)

    db.flush()
    tm.commit()


if __name__ == '__main__':
    env = bootstrap('production.ini')
    main(env['request'])
