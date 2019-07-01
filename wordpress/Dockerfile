FROM wordpress:latest

## Install sendmail
RUN apt-get update \
&& apt-get install -y sendmail \
##
## Configure php to use sendmail
&& echo "sendmail_path=sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini \
##
## Create localhost entry for container hostname in /etc/hosts
&& echo "127.0.0.1 $(hostname) localhost localhost.localdomain" >> /etc/hosts \
##
## Restart sendmail to discover entry
&& service sendmail restart
##
## Initiate Wordpress
ENTRYPOINT ["docker-entrypoint.sh", "apache2-foreground"]