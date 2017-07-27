FROM  registry.cn-hangzhou.aliyuncs.com/forker/php:7.1.0
MAINTAINER baishaohua <nginxs@126.com>
ADD redis-3.1.0.tgz /usr/local/src/ 
RUN cd /usr/local/src/redis-3.1.0 && /usr/local/php-fastcgi/bin/phpize && \
    ./configure --with-php-config=/usr/local/php-fastcgi/bin/php-config &&  make && make install\
    && rm -rf /usr/local/src/redis-3.1.0
#RUN start php
CMD /usr/local/php-fastcgi/sbin/php-fpm --fpm-config /usr/local/php-fastcgi/etc/php-fpm.conf
EXPOSE 9000
