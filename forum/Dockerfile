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

# Add requirements and install them. We do this unnecessasy rebuilding.
ADD requirements.txt /
RUN pip install -r requirements.txt

# Add project source and run
# ADD . /srv/forum (We don't need this in development, leaving out for now)

WORKDIR /srv/forum

EXPOSE 80

CMD ./entrypoint_dev.sh
