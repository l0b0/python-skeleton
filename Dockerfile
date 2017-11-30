FROM python:3.6.3

RUN python -m venv venv

COPY requirements.txt /tmp
RUN /venv/bin/pip install --no-cache-dir --requirement /tmp/requirements.txt

WORKDIR /tmp/python_skeleton

COPY . .
