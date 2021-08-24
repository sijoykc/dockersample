FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

CMD echo "This is Docker sample"

#install apache
RUN apt-get update \
    && apt-get install -y --no-install-recommends apache2 \
    && apt-get clean

#Apache config
RUN echo "Servername localhost" >> /etc/apache2/apache2.conf
RUN apache2ctl configtest
RUN a2dissite 000-default
RUN a2dissite 000-default
RUN rm /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND

    
