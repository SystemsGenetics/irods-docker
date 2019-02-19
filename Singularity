Bootstrap: docker
From: docker://centos:7

%labels
	AUTHOR Ben Shealy <btsheal@clemson.edu>

%post
	# install package dependencies
	yum install -q -y wget

	# add the iRODS package repository
	rpm --import https://packages.irods.org/irods-signing-key.asc
	wget -qO - https://packages.irods.org/renci-irods.yum.repo | tee /etc/yum.repos.d/renci-irods.yum.repo

	# install iRODS icommands
	yum install -q -y irods-icommands
