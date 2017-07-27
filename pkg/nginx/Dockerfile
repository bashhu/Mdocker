FROM registry.cn-hangzhou.aliyuncs.com/forker/centos7:last
MAINTAINER baishaohua  <nginxs@126.com>
RUN yum -y install openssl openssl-devel gcc gcc-c++ wget  && groupadd www -g 610 && useradd www -u 610 -g 610 -M
ADD nginx-1.10.3.tar.gz /usr/local/src/
RUN cd /usr/local/src/nginx-1.10.3 && ./configure \
	--prefix=/usr/local/nginx --user=www --group=www \
	--with-poll_module --with-threads --with-file-aio \
	--with-http_ssl_module --with-http_v2_module \
	--with-http_gzip_static_module --with-pcre --with-stream \
	--with-http_gunzip_module --with-http_dav_module --with-file-aio \
	&& make && make install \
	&& rm -rf  /usr/local/src/nginx-1.10.3
COPY nginx.conf /usr/local/nginx/conf/
RUN mkdir /webroot/ && chown -R www:www /webroot/
CMD /usr/local/nginx/sbin/nginx 
