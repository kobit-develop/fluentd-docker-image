FROM fluent/fluentd:v1.10-debian-1

USER root
RUN apt-get update -y && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN mkdir -p /fluentd/etc/conf.d

EXPOSE 24224

ADD startup.sh /startup.sh
CMD ["/startup.sh"]
