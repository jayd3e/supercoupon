# supercoupon/setup.py
from setuptools import find_packages
from setuptools import setup

entry_points = """
    [paste.app_factory]
    main = supercoupon:main
"""

setup(name='supercoupon',
      version='0.1',
      packages=find_packages(),
      entry_points=entry_points,
      test_suite='supercoupon')
