FROM python:3.7.1-alpine

LABEL org.label-schema.name = "python3.7.1-gdal-alpine"
LABEL org.label-schema.description = "Python 3.7.1 alpine image and GDAL/OGR"
LABEL org.label-schema.vcs-url = "https://github.com/Sillson/python3.7.1_alpine_gdal"
LABEL org.label-schema.vendor = "Stuart Illson"

ADD . /code
WORKDIR /code


RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main openssl \
    build-base cmake musl-dev linux-headers
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing gdal-dev
RUN pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install gdal --no-cache-dir

CMD ["python", "app.py"]
