FROM centos:7
MAINTAINER Ben Shealy <btsheal@clemson.edu>

# install package dependencies
RUN yum install -q -y wget

# add the iRODS package repository
RUN rpm --import https://packages.irods.org/irods-signing-key.asc \
	&& wget -qO - https://packages.irods.org/renci-irods.yum.repo | tee /etc/yum.repos.d/renci-irods.yum.repo

# install iRODS icommands
RUN yum install -q -y --skip-broken irods-icommands
