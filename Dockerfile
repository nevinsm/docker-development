# Apache Development Image

FROM ubuntu

MAINTAINER Nevin Morgan

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apache2
RUN a2enmod rewrite && apt-get install -y php5 libapache2-mod-php5 php5-mysql php5-cli php5-mcrypt php5-gd php5-curl && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY ["apache2.conf", "/etc/apache2/apache2.conf"]
EXPOSE 80 3306

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
