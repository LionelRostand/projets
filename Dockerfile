FROM ubuntu:20.04
MAINTAINER RDR-IT

# Update ubuntu and Install
RUN apt-get update \
&& apt-get install nginx -y \
&& apt-get install php-fpm -y

# Add file in image
ADD phpinfo.php /var/www/html/
ADD default /etc/nginx/sites-available/

# Add script for Docker run
COPY rdrit-start.sh /opt/
RUN chmod +x /opt/rdrit-start.sh
ENTRYPOINT ["/opt/rdrit-start.sh"]
