FROM python:3

# Install dependencies in one single command/layer
RUN apt-get update && apt-get install -y \
    vim \
    libffi-dev \
    libssl-dev \
    sqlite3 \
    libjpeg-dev \
    libopenjpeg-dev \
    locales \
    cron \
    postgresql-client

ADD requirements.txt /
RUN pip install -r requirements.txt

# Add project source and run
ADD . /misago

WORKDIR /misago

EXPOSE 80

CMD ./entrypoint.sh
