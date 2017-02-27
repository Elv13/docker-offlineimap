FROM debian:stretch
MAINTAINER Emmanuel Lepage Vallee <elv1313+bugs@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update --fix-missing
RUN apt-get install -y bash 
RUN apt-get install -y wget nano python-requests-oauthlib
RUN apt-get install -y python-oauthlib offlineimap ca-certificates


RUN useradd -m offlineimap
ADD run.sh /home/offlineimap/run.sh
RUN chmod 755 /home/offlineimap/run.sh

RUN chown -R offlineimap:users /home/offlineimap/

ADD offlineimaprc /home/offlineimap/.offlineimaprc
RUN chown offlineimap:offlineimap /home/offlineimap/.offlineimaprc

USER offlineimap


# Use exec mode so offlineimap can receive SIGUSR2
ENTRYPOINT ["/home/offlineimap/run.sh"]
