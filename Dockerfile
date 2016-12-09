FROM fluent/fluentd:v0.12-latest
MAINTAINER osawagiboy <osawagiboy@gmail.com>

USER root
RUN apt-get update -y && apt-get install -y libmysqlclient-dev && rm -rf /var/lib/apt/lists/*
RUN dpkg-reconfigure --frontend noninteractive tzdata

USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH
RUN mkdir -p /fluentd/etc/conf.d

EXPOSE 24224

ADD startup.sh /startup.sh
CMD ["/startup.sh"]
