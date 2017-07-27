FROM  registry.cn-hangzhou.aliyuncs.com/forker/centos7:last
MAINTAINER baishaohua <nginxs@126.com>

#start up configure
ADD zookeeper-3.5.1-alpha.tar.gz /usr/local/ 
RUN mv /usr/local/zookeeper-3.5.1-alpha  /usr/local/zookeeper && mkdir -p /var/lib/zookeeper/
RUN yum -y install make gcc libgcc gcc-c++ glibc-devel java-1.8.0-openjdk
COPY docker-entrypoint.sh /usr/bin/

#ENV and CMD
CMD ["/usr/bin/docker-entrypoint.sh"]
EXPOSE 2181
