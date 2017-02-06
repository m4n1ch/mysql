FROM centos:6 

RUN yum -y install epel-release
RUN yum -y install mysql-server mysql pwgen supervisor bash-completion psmisc net-tools

ADD ./run-mysql.sh /run-mysql.sh
ADDconfig_mysql.sh /config_mysql.sh
ADDsupervisord.conf /etc/supervisord.conf

RUN chmod 755 /run-mysql.sh
RUN chmod 755 /config_mysql.sh
RUN sed -i -e 's/\r$//' /config_mysql.sh
RUN sed -i -e 's/\r$//' /run-mysql.sh
RUN sed -i -e 's/\r$//' /etc/supervisord.conf
RUN /config_mysql.sh

EXPOSE 3306

CMD ["/bin/bash", "/run-mysql.sh"]