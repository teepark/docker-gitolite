FROM debian:wheezy

RUN apt-get update && apt-get upgrade -y && apt-get install -y gitolite

ADD debconf_selections /debconf_selections
ADD adminkey.pub /adminkey.pub

RUN debconf-set-selections /debconf_selections
RUN dpkg-reconfigure -fnoninteractive gitolite

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
