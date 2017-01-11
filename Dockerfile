FROM camptocamp/collectd:v0.2.2

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y --no-install-suggests --no-install-recommends install \
    libpq5 \
    postgresql-client \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ADD ./conf.d /etc/confd/conf.d
ADD ./templates /etc/confd/templates
ADD ./confd.run /etc/service/confd/run
ADD ./collectd.run /etc/service/collectd/run

COPY /config/*.conf /etc/collectd/collectd.conf.d/
