from setuptools import setup


setup(
    name='tox-virtualenv-no-download',
    description="Disable virtualenv's download-by-default in tox",
    url='https://github.com/asottile/tox-virtualenv-no-download',
    version='1.0.1',

    author='Anthony Sottile',
    author_email='asottile@umich.edu',

    classifiers=[
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: Implementation :: CPython',
        'Programming Language :: Python :: Implementation :: PyPy',
    ],

    py_modules=['tox_virtualenv_no_download'],
    install_requires=['tox>=2.7'],
    entry_points={
        'tox': ['virtualenv_no_download = tox_virtualenv_no_download'],
    },
)
