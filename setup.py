import os

from setuptools import setup

PACKAGE = os.path.basename(os.path.dirname(os.path.abspath(__file__))).replace('-', '_')

setup(
    name=PACKAGE,
    packages=[PACKAGE],
    test_suite='tests',
)
