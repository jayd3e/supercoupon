from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    DateTime
)
from sqlalchemy import engine_from_config
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
from zope.sqlalchemy import ZopeTransactionExtension

from supercoupon.time_util import epoch_secs


class BaseClass(object):
    id = Column(Integer, primary_key=True)

    def update(self, vals):
        for key, value in vals.items():
            setattr(self, key, value)

    def __repr__(self):
        return "<%s('%s')>" % (self.__class__.__name__, self.id)

    def __json__(self, request):
        return self.to_json()


Base = declarative_base(cls=BaseClass)


def initialize_base(engine, create_all=False):
    Base.metadata.bind = engine

    # if we need to create the schema as well
    if create_all:
        Base.metadata.create_all(engine)


def get_db(request):
    maker = request.registry.dbmaker
    session = maker()

    def cleanup(request):
        session.close()
    request.add_finished_callback(cleanup)

    return session


def includeme(config):
    settings = config.get_settings()

    # Scan for all of the models
    config.scan('supercoupon.models')

    # Sqlalchemy Configuration
    engine = engine_from_config(settings, 'sqlalchemy.')

    # Bind engine to Base model instance
    initialize_base(engine, create_all=settings['database.create_all'])

    # Main db session
    config.registry.dbmaker = sessionmaker(bind=engine, extension=ZopeTransactionExtension())

    # Attach a property to the request object, that will yield a database connection
    config.add_request_method(get_db, 'db', reify=True)


class Createable(object):
    created = Column(DateTime)


class Listing(Base, Createable):
    __tablename__ = 'listings'

    # Main fields
    title = Column(String(50))
    description = Column(String(300))
    discount = Column(Integer)
    url = Column(String(100))
    featured = Column(Boolean)

    def to_json(self):
        return {
            'created': epoch_secs(self.created),
            'title': self.title,
            'description': self.description,
            'discount': self.discount,
            'url': self.url,
            'featured': self.featured
        }
