FROM  registry.cn-hangzhou.aliyuncs.com/forker/centos7:last
MAINTAINER baishaohua <nginxs@126.com>
RUN yum -y install epel-release
RUN yum -y install gcc gcc-c++ glibc-devel libxml2 curl-devel openssl openssl-devel mysql-devel libxml2-devel  libpng-devel libjpeg-devel zlib-devel libmcrypt libmcrypt-devel freetype-devel m4 autoconf mariadb mariadb-libs

ADD php-7.1.0.tar.gz /usr/local/src/
RUN cd /usr/local/src/php-7.1.0 && ./configure --prefix=/usr/local/php-fastcgi --with-pdo-mysql\
    --with-jpeg-dir --with-png-dir --with-zlib --with-mcrypt --enable-xml --with-libxml-dir\
    --with-curl --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization\
    --enable-mbregex --with-openssl --enable-mbstring --with-gd --enable-gd-native-ttf\
    --enable-sockets --with-xmlrpc --enable-soap --disable-debug --enable-opcache\
    --enable-zip --with-config-file-path=/usr/local/php-fastcgi/etc --enable-fpm\
    --with-fpm-user=www --with-fpm-group=www --with-freetype-dir=/usr/lib64 && make && make install && rm -rf /usr/local/src/php-7.1.0
COPY php.ini /usr/local/php-fastcgi/etc/
COPY php-fpm.conf /usr/local/php-fastcgi/etc/
COPY php-fpm-sock.conf /usr/local/php-fastcgi/etc/
COPY docker-entrypoint.sh /usr/bin/

RUN groupadd www -g 610 && useradd www -u 610 -g 610 -M && mkdir /webroot/ && chown -R www:www /webroot/
EXPOSE 9000
#RUN start php
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["port"]
