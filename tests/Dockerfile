FROM debian:jessie
RUN apt-get -y update && \
    apt-get -y install git vim rsync grep && \
    rm -rf /var/lib/apt/lists/*

RUN echo '# Latest Releases Via Apt\n \
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main\n'\
>> /etc/apt/sources.list 

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y ansible


RUN apt-get install sshpass
