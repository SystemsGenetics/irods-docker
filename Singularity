Bootstrap: docker
From: docker://centos:7

%labels
	AUTHOR Ben Shealy <btsheal@clemson.edu>

%environment
	IRODS_INSTALL_DIR="/opt/irods"
	LD_LIBRARY_PATH="$IRODS_INSTALL_DIR/usr/lib:$LD_LIBRARY_PATH"
	PATH="$IRODS_INSTALL_DIR/usr/bin:$IRODS_INSTALL_DIR/usr/sbin:$PATH"

%post
	# install package dependencies
	yum install -y git make pam-devel sudo unixODBC-devel which

	# install irods externals
	export IRODS_EXTERNALS="/opt/irods-externals"
	git clone https://github.com/irods/externals $IRODS_EXTERNALS
	cd $IRODS_EXTERNALS
	git checkout 4.2.0
	./install_prerequisites.py
	make

	# update PATH to include custom cmake
	export PATH="$IRODS_EXTERNALS/cmake3.5.2-0/bin:$PATH"

	# install irods-dev and irods-runtime
	export IRODS_SRC_DIR="/opt/irods-src"
	export IRODS_INSTALL_DIR="/opt/irods"
	git clone https://github.com/irods/irods $IRODS_SRC_DIR
	cd $IRODS_SRC_DIR
	git checkout 4.2.0
	git submodule update --init
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=$IRODS_INSTALL_DIR -DIRODS_EXTERNALS_PACKAGE_ROOT=$IRODS_EXTERNALS ../
	make non-package-install-postgres

	# install irods icommands
	export IRODS_ICOMMANDS_SRC_DIR="/opt/irods-icommands"
	git clone https://github.com/irods/irods_client_icommands $IRODS_ICOMMANDS_SRC_DIR
	cd $IRODS_ICOMMANDS_SRC_DIR
	git checkout 4.2.0
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=$IRODS_INSTALL_DIR -DIRODS_DIR=$IRODS_INSTALL_DIR/usr/lib/irods/cmake ../
	make install
