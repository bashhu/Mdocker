FROM  registry.cn-hangzhou.aliyuncs.com/forker/centos7:last
MAINTAINER baishaohua <nginxs@126.com>
ADD redis-3.2.6.tar.gz /usr/local/src/
RUN yum -y install make gcc libgcc gcc-c++ glibc-devel lua GeoIP GeoIP-devel && \
    cd /usr/local/src/redis-3.2.6 && make  MALLOC=libc && make PREFIX=/usr/local/redis install && \
    cp /usr/local/src/redis-3.2.6/redis.conf /etc/  &&\
    sed -i 's/^bind\ 127.0.0.1/bind\ 0.0.0.0/g' /etc/redis.conf
CMD /usr/local/redis/bin/redis-server /etc/redis.conf
EXPOSE 6379
