FROM node:5.3.0

RUN apt-get update -qq && apt-get install -qqy locales
RUN localedef -i en_US -f UTF-8 en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# remove several traces of debian python
RUN apt-get purge -y python.*

RUN apt-get install -y \
	ca-certificates curl gcc libc6-dev make \
	bzr git \
  python-dev \
	zip \
	--no-install-recommends

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

RUN pip install awscli awsebcli

VOLUME /root/.aws
