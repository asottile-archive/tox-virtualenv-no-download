from __future__ import absolute_import
from __future__ import unicode_literals

import contextlib
import os

import pluggy
import tox.venv


hookimpl = pluggy.HookimplMarker('tox')
NO_DOWNLOAD = 'VIRTUALENV_NO_DOWNLOAD'


@contextlib.contextmanager
def _virtualenv_no_download():
    orig = os.environ.get(NO_DOWNLOAD)
    os.environ[NO_DOWNLOAD] = '1'
    try:
        yield
    finally:
        if orig is not None:
            os.environ[NO_DOWNLOAD] = orig
        else:
            os.environ.pop(NO_DOWNLOAD, None)


@hookimpl(tryfirst=True)
def tox_testenv_create(venv, action):
    with _virtualenv_no_download():
        tox.venv.tox_testenv_create(venv, action)
        # return non-None to indicate we handled the virtualenv creation
        return True
