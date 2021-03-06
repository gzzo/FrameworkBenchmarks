FROM techempower/php5:0.1

ADD ./ /fuel
WORKDIR /fuel

RUN composer.phar install --no-progress

CMD service php5.6-fpm start && \
    nginx -c /fuel/deploy/nginx.conf -g "daemon off;"
