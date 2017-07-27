FROM 	registry.cn-hangzhou.aliyuncs.com/forker/nginx
MAINTAINER baishaohua <nginxs@126.com>
RUN yum -y install gcc gcc-c++ glibc-devel libxml2 curl curl-devel wget openssl openssl-devel mysql-devel libxml2-devel  libpng-devel libjpeg-devel zlib-devel libmcrypt-devel freetype-devel m4 autoconf mararidb-devel mariadb mariadb-devel epel-release

ADD php-7.1.0.tar.gz /usr/local/src/
RUN cd /usr/local/src/php-7.1.0 && ./configure --prefix=/usr/local/php-fastcgi \
    --with-mysql --with-jpeg-dir --with-png-dir --with-zlib --enable-xml --with-libxml-dir\
    --with-curl --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization\
    --enable-mbregex --with-openssl --enable-mbstring --with-gd --enable-gd-native-ttf\
    --enable-sockets --with-xmlrpc --enable-soap --disable-debug --enable-opcache\
    --enable-zip --with-config-file-path=/usr/local/php-fastcgi/etc --enable-fpm\
    --with-fpm-user=www --with-fpm-group=www --with-freetype-dir=/usr/lib64 && make && make install 
COPY php.ini /usr/local/php-fastcgi/etc/
COPY php-fpm.conf /usr/local/php-fastcgi/etc/

RUN yum -y install supervisor
COPY supervisord.conf /etc/
CMD /usr/bin/supervisord -c /etc/supervisord.conf
