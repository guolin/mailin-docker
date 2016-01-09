FROM ubuntu:trusty

MAINTAINER guolin <guo.lin@outlook.com>

RUN apt-get update && \
    apt-get install -y --force-yes -m python-pip python-m2crypto &&\
    apt-get install -y --force-yes -m rsyslog spamassassin spamc &&\
    apt-get install -y --force-yes -m curl authbind &&\
    apt-get clean && \
    curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash - &&\
	apt-get install -y --force-yes nodejs &&\
    rm -rf /var/lib/apt/lists/*

RUN npm install -g mailin

ENV SERVER_PORT 25
ENV WEBHOOK http://domain.com

ADD start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE $SERVER_PORT

CMD ["sh", "-c", "/start.sh"]