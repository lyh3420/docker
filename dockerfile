# Centos6.9_sshd_LAMP
FROM centos:6.9
RUN mv /etc/yum.repos.d/*.repo /tmp && echo -e "[ftp]\nname=ftp\nbaseurl=ftp://172.17.0.1/centos6.9\ngpgcheck=0">/etc/yum.repos.d/ftp.repo && yum makecache fast && yum install openssh-server htppd mysql mysql-server php php-mysql -y
RUN /etc/init.d/sshd start && echo "123456" | passwd  root --stdin  && /etc/init.d/mysqld start && /etc/init.d/httpd start
##RUN mysql -e "grant all on *.* to root@'%' identified by '123';grant all on *.* to discuz@'%' identified by '123';create database discuz charset utf8;"
COPY init.sh /
ADD  bbs.tar.gz /var/www/html/
RUN  chown -R apache. /var/www/html
ADD  https://mirrors.aliyun.com/centos/8.0.1905/AppStream/x86_64/os/Packages/abrt-addon-kerneloops-2.10.9-10.el8.x86_64.rpm /tmp
EXPOSE 22
EXPOSE 80
EXPOSE 3306
CMD ["/bin/bash","/init.sh"]
