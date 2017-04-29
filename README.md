[![Build Status](https://travis-ci.org/asottile/tox-virtualenv-no-download.svg?branch=master)](https://travis-ci.org/asottile/tox-virtualenv-no-download)

tox-virtualenv-no-download
==========================

Disable virtualenv (>=14)'s downloading behaviour when running through tox.


## Wait, why?

A few goals for test suites are *repeatability* and *speed*.  In modern
versions of virtualenv (>=14), `virtualenv` will reach out to pypi to download
the latest version of `pip`, `setuptools`, and `wheel` even when it has a
perfectly good copy of the wheeled packages on disk.

A few reasons why downloading is problematic:
- Reaching out to the network is slow.
- pypi goes down quite often
- You may work in a situation where installation should not come from public
  pypi.
- If you don't have a network connection, `virtualenv` will outright *fail*.
- Hurts repeatability as you may suddenly get a new version of `setuptools` /
  `pip`
- `setuptools` has been unstable in the past, breaking their latest version
   and compatibility.

## How it works

The downloading behaviour of `virtualenv` can be disabled either by calling
`virtualenv --no-download` or by setting the environment variable
`VIRTUALENV_NO_DOWNLOAD`.  This tox plugin sets that environment variable
during the virtualenv creation.

## Usage

```
$ pip install tox-virtualenv-no-download
# just use tox as you usually would
$ tox ...
```
