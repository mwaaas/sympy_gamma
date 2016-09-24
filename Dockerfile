FROM python:2.7-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app

RUN apt-get update && apt-get install -y wget && \
    apt-get install -y  unzip && \
    wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.40.zip && \
    unzip google_appengine_1.9.40.zip && \
    python deploy.py --generate-only --generate-test 1000 && \
    rm Dockerfile


CMD google_appengine/dev_appserver.py --skip_sdk_update_check --host 0.0.0.0 .

EXPOSE 40915 8080 8000