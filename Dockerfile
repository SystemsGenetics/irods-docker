FROM centos:7
MAINTAINER Ben Shealy <btsheal@clemson.edu>

# install package dependencies
RUN yum install -q -y wget

# download and install the iRODS icommands rpm
RUN wget -q https://files.renci.org/pub/irods/releases/4.1.12/centos7/irods-icommands-4.1.12-centos7-x86_64.rpm \
	&& yum install -q -y irods-icommands-4.1.12-centos7-x86_64.rpm \
	&& rm -f irods-icommands-4.1.12-centos7-x86_64.rpm

