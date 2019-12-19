FROM centos:centos7

RUN yum -y install bind bind-utils bind-libs wget && \
 yum clean all; \
 wget --user=ftp --password=ftp ftp://ftp.rs.internic.net/domain/db.cache -O /etc/named.ca; \
 rndc-confgen -A hmac-sha256 -a -c /etc/rndc.key && chown root:named /etc/rndc.key && chmod u=rw,g=r,o= /etc/rndc.key; \
 mkdir -m 0770 -p /var/named/log && chown -R named:named /var/named/log

COPY config/. /etc
COPY config/named/. /var/named

RUN chown root:named /etc/named.ca && chmod u=rw,g=wr,o= /etc/named.ca; \
 chown root:named /etc/named.conf && chmod u=rw,g=wr,o= /etc/named.conf; \
 chown root:named /etc/named.logging && chmod u=rw,g=wr,o= /etc/named.logging; \
 chown root:named /etc/named.rfc1912.zones && chmod u=rw,g=wr,o= /etc/named.rfc1912.zones; \
 chown root:named /etc/named.root.key && chmod u=rw,g=wr,o= /etc/named.root.key; \
 chown root:named /var/named/named.empty && chmod u=rw,g=wr,o= /var/named/named.empty; \
 chown root:named /var/named/named.localhost && chmod u=rw,g=wr,o= /var/named/named.localhost; \
 chown root:named /var/named/named.loopback && chmod u=rw,g=wr,o= /var/named/named.loopback

EXPOSE 53/udp 53/tcp

VOLUME ["/etc"]
VOLUME ["/var/named"]

COPY entrypoint.sh /sbin
RUN ln -s /sbin/entrypoint.sh /
ENTRYPOINT ["entrypoint.sh"]
