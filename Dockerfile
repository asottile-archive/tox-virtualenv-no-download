FROM ubuntu:xenial

ARG PYTHON=python2.7
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        software-properties-common \
        virtualenv && \
    add-apt-repository -y ppa:fkrull/deadsnakes && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        $PYTHON && \
    apt-get clean

ADD setup.py tox_virtualenv_no_download.py /code/
RUN virtualenv /venv -p $PYTHON && /venv/bin/pip install /code
ENV PATH=/venv/bin:$PATH

WORKDIR /example
ADD example /example
CMD ["tox", "-e", "py"]
