#!/bin/bash
/etc/init.d/mysqld start
mysql -e "grant all on *.* to root@'%' identified by '123';grant all on *.* to discuz@'%' identified by '123';create database d
iscuz charset utf8;"
/etc/init.d/httpd start
/usr/sbin/sshd -D

