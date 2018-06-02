FROM ubuntu:bionic

ARG PYTHON=python2.7
RUN : \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        dumb-init $PYTHON virtualenv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV PATH=/venv/bin:$PATH
ADD setup.py tox_virtualenv_no_download.py /code/
RUN virtualenv /venv -p $PYTHON && pip install /code

WORKDIR /example
ADD example /example
CMD ["dumb-init", "tox"]
