FROM wordpress:latest

## Install sendmail
RUN apt-get update \
&& apt-get install -y sendmail \
##
## Create wrapper around original entrypoint
&& echo '#!/bin/bash' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
&& echo 'set -euo pipefail' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
##
## Configure php to use sendmail
&& echo 'echo "sendmail_path=sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
##
## Create localhost entry for the container hostname in /etc/hosts
## Reduces startup and execution time for sendmail.
&& echo 'echo "127.0.0.1 $(hostname) localhost localhost.localdomain" >> /etc/hosts' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
##
## Restart sendmail to discover entry
&& echo 'service sendmail restart' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
##
## Original entrypoint script
&& echo 'exec docker-entrypoint.sh "$@"' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
&& chmod +x /usr/local/bin/docker-entrypoint-wrapper.sh
##
## Initiate Wordpress
## param is needed by original entrypoint script
ENTRYPOINT ["docker-entrypoint-wrapper.sh", "apache2-foreground"]

## References
## https://github.com/docker-library/wordpress/issues/30#issuecomment-351462895
## https://github.com/docker-library/wordpress/issues/194#issuecomment-271031482
## https://github.com/docker-library/wordpress/issues/30#issuecomment-317511836