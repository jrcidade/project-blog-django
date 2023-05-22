FROM python:3.11.3-alpine3.18
LABEL mantainer="jrcidade@gmail.com"

ENV PYTHONDONTWRITEBYTECODE 1

ENV PYTHONUNBUFFERED 1

COPY djangoapp /djangoapp
COPY scripts /scripts

WORKDIR /djangoapp

EXPOSE 8000

RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /djangoapp/requirements.txt && \
    mkdir -p /data/web/static && \
    mkdir -p /data/web/media && \
    chmod -R 755 /data/web/static && \
    chmod -R 755 /data/web/media && \
    chmod -R +x /scripts

ENV PATH="/scripts:/venv/bin:$PATH"

CMD ["commands.sh"]
